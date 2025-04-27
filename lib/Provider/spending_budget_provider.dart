import 'dart:async';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class SpendingBudgetProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  String totalBudget = "0";
  String totalSpendBudget = "0";
  Map<String , dynamic> spendingBudgetData = {};
  bool isLoading = false;
  Future<void> getSpendingBudget(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getSpendingBudget();
      if (response.statusCode == 200) {
        isLoading = false;
        spendingBudgetData = response.data;
        totalBudget = spendingBudgetData['total_categories_budget'].toString();
        totalSpendBudget = spendingBudgetData['total_spent'].toString();
        notifyListeners();
      }
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log("${ AppLocalizations.of(context)!.error_fetching_scheduleModelData}: $error");
    } finally {
      print("its final ");
      notifyListeners();
    }
  }


  bool isBudgetSetLoading = false;
  Future<void> budgetSet({required String price , required String categoryID,BuildContext? context}) async {
    isBudgetSetLoading = true;
    notifyListeners();
    Map<String , dynamic> body ={
      'category_id': categoryID,
      'budget': price
    };
    try {
      Response response = await _apiService.setBudget(params: body);
      if (response.statusCode == 200) {
        isBudgetSetLoading = false;
        getSpendingBudget(context!);
        Get.back();
        FlutterToast.toastMessage(message:  AppLocalizations.of(context!)!.set_budget);
        notifyListeners();
      }
    } catch (error) {
      isBudgetSetLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      isBudgetSetLoading = false;
      print("its final ");
      notifyListeners();
    }
  }




  bool isAddCategoryLoading = false;
  void _addCat({required bool load}){
    isAddCategoryLoading = load;
    notifyListeners();
  }
  Future<void> addUserCategory({
    required String categoryName,
    required String price,
    required String providerName,
    XFile? categoryImage,
    required BuildContext context,
    XFile? providerImage,
  }) async {
    _addCat(load: true);
    FormData formData = FormData.fromMap({
      'category_name': categoryName,
      'price': price,
      'provider_name': providerName, // corrected this line
    });

    if (categoryImage != null) {
      formData.files.add(MapEntry(
        'category_image',
        await MultipartFile.fromFile(categoryImage.path, filename: categoryImage.path.split('/').last),
      ));
    }
    if (providerImage != null) {
      formData.files.add(MapEntry(
        'provider_image',
        await MultipartFile.fromFile(providerImage.path, filename: providerImage.path.split('/').last),
      ));
    }

    try {
      Response response = await _apiService.addCategories(params: formData);
      if (response.statusCode == 200) {
        getSpendingBudget(context!);
        Provider.of<CategoryProvider>(context,listen: false).getAllCategory();
        _addCat(load: false);
        FlutterToast.toastMessage(message: AppLocalizations.of(context)!.category_added_successfully);
        Get.back();
        if (kDebugMode) {
          print("hit successfully");
        }
      } else {
        _addCat(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    } catch (error) {
      _addCat(load: false);
      print("this is error ${error.toString()}");
    }
  }



  bool isAddProviderInUserCategoryLoading = false;
  Future<void> addProviderInUserCategory({ required BuildContext context,   XFile? providerImage,required String providerName , required String categoryID}) async {
    isAddProviderInUserCategoryLoading = true;
    notifyListeners();
    FormData formData = FormData.fromMap({
      'name': providerName,
      'category_id': categoryID
    });
    if (providerImage != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(providerImage.path.toString(), filename: providerImage.path.toString().split('/').last),
      ));
    }

    try {
      Response response = await _apiService.addProviderInUserCategory(params: formData);
      if (response.statusCode == 200) {
        Provider.of<CategoryProvider>(context,listen: false).getAllCategory();
        isAddProviderInUserCategoryLoading = false;
        getSpendingBudget(context!);
        Get.back();
        FlutterToast.toastMessage(message: AppLocalizations.of(context)!.provider_added_successfully);
        notifyListeners();
      }
    } catch (error) {
      isAddProviderInUserCategoryLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      isAddProviderInUserCategoryLoading = false;
      print("its final ");
      notifyListeners();
    }
  }


}