import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/schedule_provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/addNewSubscription/model/all_category_model.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/description_dialog.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/show_catogeries.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/show_sub_categories.dart';

class SubscriptionInfoProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  bool _isUpdateSub = false;
  bool get isUpdateSub => _isUpdateSub;
  void _updateSubLoading({required bool load}){
    _isUpdateSub = load;
    notifyListeners();
  }
  Future<void> updateSubscription({
    required String description,
    required String startDate,
    required String renewalDate,
    required String billingCycle,
    required String price,
    required BuildContext context,
    required String subscriptionID,
    required String reminderDuration,
    required String categoryID,
    required String providerId,
    FilePickerResult? image,
    // FilePickerResult? document,
  }) async {
    _updateSubLoading(load: true);
    String cleanedPrice = price.replaceAll('\$', '');
    FormData formData = FormData.fromMap({
      'category_id': categoryID,
      'provider_id': providerId,
      'description': description,
      'start_date': startDate,
      'renewal_date': renewalDate,
      'billing_cycle': billingCycle,
      'reminder': reminderDuration,
      'price': cleanedPrice,
      '_method': "PUT",
    });
    print("this is body ${formData.fields}");
    if (image != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(image.files[0].path.toString(), filename: image.files[0].path.toString().split('/').last),
      ));
    }


    try {
      Response response = await _apiService.updateSubscription(params: formData,subscriptionID: subscriptionID);
      if (response.statusCode == 200) {
        _updateSubLoading(load: false);
        final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
        Provider.of<ScheduleProvider>(context,listen: false).getScheduleData(date: dateFormat.format(DateTime.now()));
        Provider.of<SubscriptionProvider>(context,listen: false).getSubscriptions();
        FlutterToast.toastMessage(message:AppLocalizations.of(context)!.subscription_added_successfully);
        Get.back();
        // Get.to(() => SubscriptionInfo(subscriptionInfoData: {}));
        if (kDebugMode) {
          print("hit successfully");
        }
      } else {
        _updateSubLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    } catch (error) {
      _updateSubLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

  FilePickerResult? filePath;

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
      ],
    );
    if (result != null) {
      filePath = result;
      notifyListeners();
    }
  }
  void showCategories({required BuildContext context, required CategoryProvider provider}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowCategories(provider: provider,);
      },
    );
  }
  void showSubcategories({required BuildContext context, required Categories category}) {
    final subcategories = category.providers ?? [];
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ShowSubCategories(context: context,category: category,providers: subcategories,);
      },
    );
  }

  void showDescriptionDialog(
      {required BuildContext context,}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DescriptionDialog(context: context,);
      },
    );
  }
  String  priceInString = "";
  TextEditingController descriptionController = TextEditingController();
  String startDateInString = "";
  String renewalDateInString = "";
  String _categoryName = "";
  String get categoryName => _categoryName;
  String _subCategoryName = "";
  String get subCategoryName => _subCategoryName;
  String _subCategoryID = "";
  String get subCategoryID => _subCategoryID;
  String _categoryID = "";
  String get categoryID => _categoryID;
  Future<void> setAllValue({required String price, required String desc, required String categoryName,
    required String providerName, required String startDate,required String renewalDate,
    required String billingRecycle,required String reminder,required String categoryID, required String providerID})async{
    priceInString = price;
    descriptionController.text = desc;
    _categoryName = categoryName;
    _subCategoryName = providerName;
    startDateInString = startDate;
    renewalDateInString = renewalDate;
    selectedBilling = billingRecycle;
    selectedReminder = reminder;
    _categoryID = categoryID;
    _subCategoryID = providerID;
    notifyListeners();
  }
  Future<void> startDate({required BuildContext context})async{
    DateTime? selectedDate =  await _selectDate(context);
    final DateFormat dateFormat =
    DateFormat('yyyy-MM-d');
    if (selectedDate != null) {
      startDateInString = dateFormat.format(selectedDate);
    notifyListeners();
    }
  }
  Future<void> renewalDate({required BuildContext context})async{
    DateTime? selectedDate = await _selectDate(context);
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // Updated format
    if (selectedDate != null) {
      renewalDateInString = dateFormat.format(selectedDate);
      notifyListeners();
    }
  }
  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2050);

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: DatePickerDialog(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
          ),
        );
      },
    );
  }
  void setAllCategoryValue({required String categoryID, required String subCategoryID ,
    required String subCategoryName,required String categoryName  }){
    _categoryID = categoryID;
    _categoryName = categoryName;
    _subCategoryID = subCategoryID;
    _subCategoryName = subCategoryName;
    notifyListeners();
    Get.back();
  }

  String selectedReminder = "";
  void showReminderPopupMenu(BuildContext context, Offset tapPosition) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        tapPosition.dx,
        tapPosition.dy,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'Weekly',
          child: Text("Weekly"),
        ),
        const PopupMenuItem<String>(
          value: 'Monthly',
          child: Text('Monthly'),
        ),
        const PopupMenuItem<String>(
          value: 'Yearly',
          child: Text('Yearly'),
        ),
        const PopupMenuItem<String>(
          value: 'Never',
          child: Text('Never'),
        ),
      ],
      elevation: 8.0,
    );

    if (selected != null) {
        selectedReminder = selected;
      print(selectedReminder);
      notifyListeners();
    }
  }
  String selectedBilling = "";
  void showBillingPopupMenu(BuildContext context, Offset tapPosition) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        tapPosition.dx,
        tapPosition.dy,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'Weekly',
          child: Text("Weekly"),
        ),
        const PopupMenuItem<String>(
          value: 'Monthly',
          child: Text('Monthly'),
        ),
        const PopupMenuItem<String>(
          value: 'Yearly',
          child: Text('Yearly'),
        ),        const PopupMenuItem<String>(
          value: 'Never',
          child: Text('Never'),
        ),
      ],
      elevation: 8.0,
    );

    if (selected != null) {
        selectedBilling = selected;
      print(selectedBilling);
      notifyListeners();
    }
  }
}