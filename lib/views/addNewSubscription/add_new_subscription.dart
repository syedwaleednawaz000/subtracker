import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/addNewSubscription/base/hbocontainer.dart';
import 'package:sub_tracker/views/addNewSubscription/model/all_category_model.dart';

import 'package:intl/intl.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final TextEditingController _monthlyPriceController = TextEditingController();

  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _imagePhoto;
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _pickImageForPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imagePhoto = image;
    });
  }

  void showSubcategories(BuildContext context, Categories category) {
    final subcategories = category.providers ?? [];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                '${ AppLocalizations.of(context)!.subcategories_of} ${category.name}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ...subcategories.map((subCat) {
                return ListTile(
                    title: Text(subCat.name ?? ""),
                    onTap: () {
                      Provider.of<CategoryProvider>(context, listen: false)
                          .setAllCategoryValue(
                              categoryID: category.id.toString(),
                              categoryName: category.name.toString(),
                              subCategoryID: subCat.id.toString(),
                              subCategoryName: subCat.name.toString());
                    });
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  void showCategories(BuildContext context, CategoryProvider provider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: provider.categories.map((category) {
                    return ListTile(
                      title: Text(category.name ?? ""),
                      onTap: () {
                        Navigator.pop(context);
                        showSubcategories(context, category);
                      },
                    );
                  }).toList(),
                ),
              );
      },
    );
  }

  void _incrementText() {
    setState(() {
      String text = _monthlyPriceController.text;
      text = text.replaceAll(RegExp(r'[^0-9-]'),
          ''); // Remove all non-numeric characters except for the negative sign
      int currentValue =
          int.tryParse(text) ?? 0; // Parse current text to an integer
      currentValue += 1; // Increment the value
      _monthlyPriceController.text = currentValue.toString();
    });
  }

  void _decrementText() {
    setState(() {
      String text = _monthlyPriceController.text;
      text = text.replaceAll(RegExp(r'[^0-9-]'),
          ''); // Remove all non-numeric characters except for the negative sign
      int currentValue =
          int.tryParse(text) ?? 0; // Parse current text to an integer
      if (currentValue >= 2) {
        currentValue -= 1; // Decrement the value
        _monthlyPriceController.text = currentValue.toString();
      }
    });
  }

  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getAllCategory();
    super.initState();
    DateTime currentDate = DateTime.now();

    // _selectedStartDate = currentDate;
    // _selectedRenewalDate = currentDate;
    dateInputController.text = "Select date";
    renewalDateController.text = "select date ";

    _monthlyPriceController.addListener(_formatInput);
  }

  void _formatInput() {
    String currentValue = _monthlyPriceController!.text;
    if (currentValue.isNotEmpty && !currentValue.startsWith("\$")) {
      _monthlyPriceController!.value = TextEditingValue(
        text: "\$" + currentValue.replaceAll("\$", ""),
        selection: TextSelection.collapsed(offset: currentValue.length + 1),
      );
    }
  }

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  final DateFormat _dateFormat1 = DateFormat('yyyy-MM-dd');
  TextEditingController dateInputController = TextEditingController();
  TextEditingController renewalDateController = TextEditingController();
  DateTime? _selectedStartDate;
  DateTime? _selectedRenewalDate;

  Future<void> _startDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate ?? currentDate,
      firstDate: currentDate,
      // Disable all previous dates
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Header text and icons color
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? SizedBox(),
        );
      },
    );

    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
        dateInputController.text = _dateFormat1.format(picked);
      });
    }
  }

  Future<void> _renewalDate(BuildContext context) async {
    if (_selectedStartDate == null) {
      // Handle case where start date hasn't been selected yet
      print("Please select the start date first.");
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedRenewalDate ??
          _selectedStartDate!.add(const Duration(days: 1)),
      firstDate: _selectedStartDate!.add(const Duration(days: 1)),
      // Disable the start date and all earlier dates
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Header text and icons color
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (picked != null && picked != _selectedRenewalDate) {
      setState(() {
        _selectedRenewalDate = picked;
        renewalDateController.text = _dateFormat1.format(picked);
      });
    }
  }

  @override
  void dispose() {
    _monthlyPriceController.removeListener(_formatInput);
    _monthlyPriceController.dispose();
    super.dispose();
  }

  FilePickerResult? _filePath;

  Future<void> _pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        _filePath = result;
        // _filePath = result.files.single.path;
      });
    }
  }

  final List<String> items = [
    '1 week',
    '1 Month',
    '1 Year',
  ];
  final List<String> billingCycleData = [
    '1 week',
    '1 month',
    '1 year',
  ];
  String? billingValue;
  String? remindDurationValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23):
      Color(0XFFFFFFFF),
      appBar:  CustomAppBarInAll(leading: false,title: AppLocalizations.of(context)!.new_new),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Above container
                Container(
                  height: MySize.scaleFactorHeight * 480,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ?  Colors.black
                          : const Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(MySize.size24),
                          bottomRight: Radius.circular(MySize.size24))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MySize.size30,
                      ),
                      Text(
                        AppLocalizations.of(context)!.add_new_subscription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MySize.size40,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          fontFamily: 'Inter',
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF1C1C23),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size40,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.halfOneDriveLogo1,
                              ),
                              const Spacer(),
                              _pickedImage == null
                                  ? const TresorlyContainer()
                                  : GestureDetector(
                                      onTap: _pickImage,
                                      child: Container(
                                        height: MySize.size80,
                                        width: MySize.size80,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent),
                                        child: ClipOval(
                                          child: Image.file(
                                            File(_pickedImage!.path),
                                            height: MySize.size100,
                                            width: MySize.size100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                              const Spacer(),
                              Image.asset(AppImages.halfSpotifyLogo1),
                            ],
                          ),
                          // Positioned editing icon
                          Positioned(
                            top: MySize.scaleFactorWidth * 125,
                            left: MySize.scaleFactorWidth * 235,
                            //right: MySize.scaleFactorWidth*,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Image.asset(
                                AppImages.editingIcon,
                                height: MySize.size28,
                                width: MySize.size28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size16,
                      ),
                      Consumer<CategoryProvider>(
                        builder: (context, categoryProvider, child) {
                          return Text(
                            categoryProvider.categoryName.isEmpty
                                ?  AppLocalizations.of(context)!.tresorly
                                : categoryProvider.categoryName,
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Colors.white
                                  : const Color(0xFF333339),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: MySize.size14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Tooltip(
                            message:
                            AppLocalizations.of(context)!.if_the_provider_is_already_listed_you_can_select_it_from_here_instead_of_adding_a_new_one,
                            decoration: BoxDecoration(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? Colors.white
                                  : const Color(0xFF333339),
                              // Set the background color of the tooltip
                              borderRadius: BorderRadius.circular(MySize.size4),
                            ),
                            child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  AppImages.exclMark,
                                  width: MySize.size15,
                                  height: MySize.size15,
                                )),
                          ),
                          SizedBox(
                            width: MySize.size4,
                          ),
                          Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Text(
                            AppLocalizations.of(context)!.select_subscription_provider,
                                  style: TextStyle(
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0xFF666680)
                                        : const Color(0xFF666680),
                                  ),
                                )
                              : Text(
                            AppLocalizations.of(context)!.select_subscription_provider,
                                  style: TextStyle(
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFF666680)
                                        : const Color(0XFF666680),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: MySize.size4,
                      ),
                      Consumer<CategoryProvider>(
                        builder: (context, categoryProvider, child) {
                          return GestureDetector(
                            onTap: () {
                              showCategories(context, categoryProvider);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: MySize.size24),
                              height: MySize.scaleFactorHeight * 43,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(MySize.size16),
                                  border: Border.all(
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFFFFFFFF)
                                            .withOpacity(.1)
                                        : const Color(0XFF353542)
                                            .withOpacity(.1),
                                  )),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size16),
                                    child: Icon(Icons.expand_more,
                                      color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                          darkMode
                                          ? Colors.white
                                          : const Color(0XFF353542).withOpacity(0.3),)
                                  ),
                                   SizedBox(width: MySize.size12),
                                  Text(
                                    categoryProvider.subCategoryName == ""
                                        ?  AppLocalizations.of(context)!.select_subscription_provider
                                        : categoryProvider.subCategoryName,
                                    style: TextStyle(
                                      fontSize: MySize.size12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0xFFA2A2B5)
                                          : const Color(0xFF666680).withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      // SizedBox(height: MySize.size10,)
                    ],
                  ),
                ),

                 SizedBox(
                  height: MySize.scaleFactorHeight * 23,
                ),
                // SizedBox(
                //   height: 4,
                //   child: ListView(
                //     children: [
                //       SizedBox(
                //         height: MySize.size34,
                //       ),
                //     ],
                //   ),
                // ),

                /// below container
                Text(
                  AppLocalizations.of(context)!.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0xFF666680)
                            : const Color(0xFF666680),
                  ),
                ),
                SizedBox(
                  height: MySize.size4,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: TextFormField(
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return  AppLocalizations.of(context)!.please_enter_description;
                      }
                      return null;
                    },
                    controller: descriptionController,
                    cursorColor:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0xFFFFFFFF)
                            : const Color(0XFF1C1C23),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0xffffffff)
                            : Colors.black,
                      ),
                      contentPadding:  EdgeInsets.symmetric(
                          horizontal: MySize.size30, vertical: MySize.size10),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MySize.size16),

                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                              ? const Color(0xff353542)
                              : const Color(0xff353542).withOpacity(.10),
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MySize.size16),

                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0xff353542)
                              : const Color(0xff353542).withOpacity(.10),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MySize.size12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size16),
                        border: Border.all(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0xffffffff)
                              : Colors.black,
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MySize.size30),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.start_date,
                            style: TextStyle(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0xFFA2A2B5)
                                  : const Color(0xFFA2A2B5),
                              fontSize: MySize.size16,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: MySize.size10,
                          ),
                          Text(
                            _selectedStartDate == null
                                ?  AppLocalizations.of(context)!.select_date
                                : _dateFormat.format(_selectedStartDate!),
                            style: TextStyle(
                              fontSize: MySize.size16,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                _startDate(context);
                              },
                              icon: Icon(
                                Icons.calendar_today,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                size: MySize.size18,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size16),
                        border: Border.all(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0xffffffff)
                              : Colors.black,
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MySize.size30),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.renewal_date,
                            style: TextStyle(
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFFA2A2B5),
                              fontSize: MySize.size16,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: MySize.size10,
                          ),
                          Text(
                            _selectedRenewalDate == null
                                ?  AppLocalizations.of(context)!.select_date
                                : _dateFormat.format(_selectedRenewalDate!),
                            style: TextStyle(
                              fontSize: MySize.size16,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                _renewalDate(context);
                              },
                              icon: Icon(
                                Icons.calendar_today,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                size: MySize.size18,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MySize.size20),
                      )),
                      hint: Row(
                        children: [
                          SizedBox(width: MySize.size4),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.billing_cycle,
                              style: TextStyle(
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.bold,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: MySize.size14,
                                    fontWeight: FontWeight.bold,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFFA2A2B5)
                                        : const Color(0XFFA2A2B5),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: billingValue,
                      onChanged: (String? value) {
                        setState(() {
                          billingValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return  AppLocalizations.of(context)!.please_select_a_billing_cycle;
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: MySize.size12,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MySize.size20),
                      )),
                      hint: Row(
                        children: [
                          SizedBox(width: MySize.size4),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.reminder_duration,
                              style: TextStyle(
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.bold,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: billingCycleData
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: MySize.size14,
                                    fontWeight: FontWeight.bold,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFFA2A2B5)
                                        : const Color(0XFFA2A2B5),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: remindDurationValue,
                      onChanged: (String? value) {
                        setState(() {
                          remindDurationValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return  AppLocalizations.of(context)!.please_select_a_remind_duration;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MySize.size24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MySize.size30)),
                  width: double.infinity,
                  height: MySize.size100,
                  child: GestureDetector(
                    onTap: () {
                      _pickImageForPhoto();
                    },
                    child: DottedBorder(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? const Color(0xffffffff)
                          : Colors.black,
                      borderType: BorderType.RRect,
                      strokeWidth: 1,
                      // borderPadding: EdgeInsets.all(8),
                      radius: Radius.circular(MySize.size10),
                      padding: EdgeInsets.all(MySize.size8),
                      child: _imagePhoto != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Image.file(
                                    File(_imagePhoto!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: MySize.size20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _pickImageForPhoto();
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: MySize.size20,
                                          )),
                                      Text(
                                        AppLocalizations.of(context)!.upload_image,
                                        style: TextStyle(
                                            fontSize: MySize.size10,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload,
                                    size: MySize.size20,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0xffFFFFFF)
                                        : const Color(0XFFA2A2B5),
                                  ),
                                  SizedBox(
                                    height: MySize.size10,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.no_image_selected,
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0xffFFFFFF)
                                          : const Color(0XFFA2A2B5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MySize.size24),
                  child: SizedBox(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.width*0.2,
                    child: DottedBorder(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? const Color(0xffffffff)
                          : Colors.black,
                      borderType: BorderType.RRect,
                      strokeWidth: 1,
                      // borderPadding: EdgeInsets.all(8),
                      radius: Radius.circular(MySize.size10),
                      padding: EdgeInsets.all(MySize.size8),
                      child: GestureDetector(
                        onTap: _pickDocument,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                size: MySize.size20,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0XFFA2A2B5),
                              ),
                              _filePath != null
                                  ? Text(
                                      textAlign: TextAlign.center,
                                      '${ AppLocalizations.of(context)!.file_name}: ${_filePath!.names[0]}',
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : Text(
                                AppLocalizations.of(context)!.no_document_selected,
                                      style: TextStyle(
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0xffFFFFFF)
                                                : const Color(0XFFA2A2B5),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MySize.size30,
                ),

                /// row of price customizing

                Padding(
                  padding: EdgeInsets.only(
                      left: MySize.size24, right: MySize.size24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _decrementText();
                        },
                        child: Container(
                          height: MySize.scaleFactorHeight * 48,
                          width: MySize.scaleFactorWidth * 48,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFCFCFFC).withOpacity(.15)
                                    : const Color(0XFFCFCFFC).withOpacity(.15),
                              ),
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFF4E4E61).withOpacity(.1)
                                  : const Color(0XFF4E4E61).withOpacity(.2),
                              borderRadius: BorderRadius.circular(16)),
                          child: Icon(Icons.remove,
                              size: MySize.size30,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFF4E4E61)
                                  : const Color(0XFF353542)),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.monthly_price,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: MySize.size12,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFF83839C)
                                    : const Color(
                                        0XFF83839C) //: Color(0XFF333339),
                                ),
                          ),
                          SizedBox(
                            height: MySize.size4,
                          ),
                          SizedBox(
                            width: 100,
                            child: Consumer<CurrencyProvider>(
                              builder: (context, currencyProvider, child) {
                                return TextFormField(
                                  controller: _monthlyPriceController,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: MySize.size24,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? Colors.white
                                        : const Color(0XFF333339),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    hintText:
                                        "${currencyProvider.selectedCurrencySymbol} 0.0",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: MySize.size24,
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? Colors.white
                                          : const Color(0XFF333339),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFF353542)
                                                : const Color(0XFF353542))),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFF353542)
                                                : const Color(0XFF353542))),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _incrementText();
                        },
                        child: Container(
                          height: MySize.scaleFactorHeight * 48,
                          width: MySize.scaleFactorWidth * 48,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFCFCFFC).withOpacity(.15)
                                    : const Color(0XFFCFCFFC).withOpacity(.15),
                              ),
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFF4E4E61).withOpacity(.1)
                                  : const Color(0XFF4E4E61).withOpacity(.2),
                              borderRadius: BorderRadius.circular(16)),
                          child: Icon(Icons.add,
                              size: MySize.size30,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFF4E4E61)
                                  : const Color(0XFF353542)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size38,
                ),

                /// Add this subscription button
                Consumer<SubscriptionProvider>(
                  builder: (context, subscriptionProvider, child) {
                    return Consumer<CategoryProvider>(
                      builder: (context, categoryProvider, child) {
                        return InkWell(
                            onTap: () {
                              if (categoryProvider.subCategoryID.isNotEmpty) {
                                if (_formKey.currentState!.validate()) {
                                  // Check if image and document are selected
                                  if (_imagePhoto != null &&
                                      _filePath != null) {
                                    // Convert the selected dates to DateTime objects
                                    DateTime startDate = _selectedStartDate!;
                                    DateTime renewalDate =
                                        _selectedRenewalDate!;

                                    // Check if the renewal date is greater than the start date
                                    if (renewalDate.isAfter(startDate)) {
                                      // Proceed with adding the subscription
                                      subscriptionProvider.addNewSubscription(
                                        image: _imagePhoto,
                                        document: _filePath,
                                        providerId:
                                            categoryProvider.subCategoryID,
                                        description:
                                            descriptionController.text.trim(),
                                        startDate:
                                            _dateFormat.format(startDate),
                                        renewalDate:
                                            _dateFormat.format(renewalDate),
                                        billingCycle: billingValue.toString(),
                                        categoryID: categoryProvider.categoryID,
                                        price:
                                            _monthlyPriceController.text.trim(),
                                        reminderDuration:
                                            remindDurationValue.toString(),
                                      );
                                    } else {
                                      FlutterToast.toastMessage(message: AppLocalizations.of(context)!.renewal_date_must_be_greater_than_start_date, isError: true);
                                    }
                                  } else {
                                    FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.please_select_both_image_and_document, isError: true);
                                  }
                                }
                              } else {
                                FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.please_select_provider, isError: true);
                              }
                            },
                            child: Container(
                              height: MySize.scaleFactorHeight * 48,
                              width: MySize.scaleFactorWidth * 324,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size24),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.purpleBE,
                                      spreadRadius: 2,
                                      blurRadius: 25,
                                      offset: Offset(0, 9),
                                    ),
                                    BoxShadow(
                                      color: AppColors.purpleFF,
                                      offset: Offset(-5, 0),
                                    ),
                                    BoxShadow(
                                      color: AppColors.purpleFF,
                                      offset: Offset(5, 0),
                                    )
                                  ]),
                              child: subscriptionProvider.isStoreSub == true
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.add_this_subscription,
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Regular-Poppins',
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.white
                                                  : Colors.white,
                                        ),
                                      ),
                                    ),
                            ));
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
