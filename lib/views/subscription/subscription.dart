import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscription/base/hbocontainer.dart';
import 'package:sub_tracker/views/subscription/model/all_category_model.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';
import 'package:intl/intl.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final TextEditingController _monthlyPriceController = TextEditingController();


  ///
  final Map<String, List<String>> categories = {
    'Streaming Services': [
      'Netflix',
      'Hulu',
      'Disney+',
      'Amazon Prime Video',
      'HBO Max',
      'Apple TV+',
      'YouTube Premium',
      'Spotify',
      'Pandora',
      'Tidal',
    ],
    'Productivity Tools': [
      'Microsoft 365',
      'Google Workspace (formerly G Suite)',
      'Adobe Creative Cloud',
      'Evernote',
      'Trello',
      'Slack',
      'Zoom',
      'Dropbox',
      'Notion',
      'Todoist',
    ],
    'Cloud Storage': [
      'Google Drive',
      'Dropbox',
      'iCloud',
      'OneDrive',
      'Box',
    ],
    'Fitness and Wellness': [
      'Peloton',
      'Fitbit Premium',
      'Apple Fitness+',
      'Headspace',
      'Calm',
      'MyFitnessPal Premium',
      'Strava Summit',
    ],
    'News and Magazines': [
      'The New York Times',
      'The Washington Post',
      'The Wall Street Journal',
      'The Guardian',
      'Bloomberg',
      'Financial Times',
      'The Economist',
      'Wired',
      'National Geographic',
    ],
    'Gaming': [
      'Xbox Game Pass',
      'PlayStation Plus',
      'Nintendo Switch Online',
      'EA Play',
      'Apple Arcade',
      'Humble Bundle', // Added new entry
    ],
    'Other Services': [
      'Amazon Prime',
      'Audible',
      'Scribd',
      'Patreon',
      'Skillshare',
      'MasterClass',
      'Canva',
      'LinkedIn Premium',
      'Tinder Plus/Gold',
      'Bumble Boost/Premium',
    ],
  };
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
                'Subcategories of ${category.name}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ...subcategories.map((subCat) {
                return ListTile(
                  title: Text(subCat.name ?? ""),
                  onTap: () {
                    Provider.of<CategoryProvider>(context,listen: false).setAllCategoryValue(categoryID: category.id.toString(),categoryName: category.name.toString(),subCategoryID: subCat.id.toString(),subCategoryName: subCat.name.toString());
                  }
                );
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
            ? Center(child: CircularProgressIndicator())
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
      if(currentValue >= 2){
        currentValue -= 1; // Decrement the value
        _monthlyPriceController.text = currentValue.toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();

    _selectedDate = currentDate;
    _selectedDate1 = currentDate;
    dateInputController.text = _dateFormat.format(currentDate);
    renewalDateController.text = _dateFormat.format(currentDate);

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

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime? _selectedDate1;
  final DateFormat _dateFormat1 = DateFormat('yyyy-MM-dd');
  TextEditingController dateInputController = TextEditingController();
  TextEditingController renewalDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Header text and icons color
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? SizedBox(),
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateInputController.text = _dateFormat1.format(picked);
      });
    }
  }

  Future<void> _renewalDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate1 ?? currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Header text and icons color
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? SizedBox(),
        );
      },
    );

    if (picked != null && picked != _selectedDate1) {
      setState(() {
        _selectedDate1 = picked;
        print("this is my selected value $billingValue");
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
      // resizeToAvoidBottomInset: false,
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Above container
                Container(
                  height: MySize.scaleFactorHeight * 515,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? const Color(0XFF353542)
                          : const Color(0XFFF1F1FF),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(MySize.size24),
                          bottomRight: Radius.circular(MySize.size24))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 22),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(AppImages.backArrow),
                            ),
                            SizedBox(
                              width: MySize.scaleFactorWidth * 145,
                            ),
                            Text(
                              'New',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: MySize.size16,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFF424252),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MySize.size20,
                      ),
                      Text(
                        'Add new\nsubscription',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? const Color(0xffFFFFFF)
                              : const Color(0XFF1C1C23),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImages.halfOneDriveLogo1,
                          ),
                          SizedBox(
                            width: MySize.scaleFactorWidth * 86,
                          ),
                          const TresorlyContainer(),
                          SizedBox(
                            width: MySize.scaleFactorWidth * 91.2,
                          ),
                          Image.asset(AppImages.halfSpotifyLogo1)
                        ],
                      ),
                      SizedBox(
                        height: MySize.size16,
                      ),
                      Consumer<CategoryProvider>(builder: (context, categoryProvider, child) {
                        return                       Text(
                          categoryProvider.categoryName.isEmpty ? 'Tresorly':categoryProvider.categoryName,
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Colors.white
                                : const Color(0XFF333339),
                          ),
                        );
                      },),
                      SizedBox(
                        height: MySize.size15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tooltip(
                            message:
                                "If the provider is already listed, you can select it from here instead of adding a new one.",
                            decoration: BoxDecoration(
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Colors.white
                                  : const Color(0XFF333339),
                              // Set the background color of the tooltip
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: GestureDetector(
                                onTap: () {
                                },
                                child: Image.asset(AppImages.exclMark)),
                          ),
                          SizedBox(
                            width: MySize.size4,
                          ),
                          Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                              ? Text(
                                  'Select Subscription Provider',
                                  style: TextStyle(
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFF666680)
                                        : const Color(0XFF666680),
                                  ),
                                )
                              : Text(
                                  'Select Subscription Provider',
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
                        height: MySize.size10,
                      ),
            Consumer<CategoryProvider>(builder: (context, categoryProvider, child) {
              return                       GestureDetector(
                onTap: () {
                  showCategories(context, categoryProvider);
                },
                child: Container(
                  height: MySize.size40,
                  width: MySize.scaleFactorWidth * 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: Provider.of<ThemeChanger>(context)
                            .themeData ==
                            darkMode
                            ? const Color(0XFFFFFFFF).withOpacity(.1)
                            : const Color(0XFF353542).withOpacity(.4),
                      )),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search,
                            color: Color(0xff666680)),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        categoryProvider.subCategoryName == ""?
                            "Select subscription Provider":categoryProvider.subCategoryName,
                        style: TextStyle(
                          fontSize: MySize.size12,
                          fontWeight: FontWeight.w500,
                          color: Provider.of<ThemeChanger>(context)
                              .themeData ==
                              darkMode
                              ? const Color(0XFFA2A2B5)
                              : const Color(0XFFA2A2B5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 4,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MySize.size34,
                      ),
                    ],
                  ),
                ),

                /// below container
                Text(
                  'Description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0XFF666680)
                            : const Color(0XFF666680),
                  ),
                ),
                SizedBox(
                  height: MySize.size4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(

                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                    controller: descriptionController,
                    cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFFFFFFFF)
                        : const Color(0XFF1C1C23),
                    decoration: InputDecoration(

                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0xffffffff)
                            :  Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
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
                              ? const Color(0xff353542)
                              : const Color(0XFF353542).withOpacity(.10),
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MySize.size30),
                      child: Row(
                        children: [
                          Text(
                            "Start Date:",
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
                            _dateFormat.format(_selectedDate!),
                            style: TextStyle(
                              fontSize: MySize.size16,
                              fontFamily: '',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                _selectDate(context);
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
                              ? const Color(0XFFFFFFFF).withOpacity(.1)
                              : const Color(0XFF353542).withOpacity(.4),
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MySize.size30),
                      child: Row(
                        children: [
                          Text(
                            "Renewal Date:",
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
                            _dateFormat.format(_selectedDate1!),
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
                                    : const Color(0XFFA2A2B5),                                size: MySize.size18,
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
                        )
                      ),
                      hint: Row(
                        children: [
                          SizedBox(width: MySize.size4),
                          Expanded(
                            child: Text(
                              'Billing Cycle',
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
                          return 'Please select a billing cycle';
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
                          )
                      ),
                      hint: Row(
                        children: [
                          SizedBox(width: MySize.size4),
                          Expanded(
                            child: Text(
                              'Reminder duration',
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
                          return 'Please select a remind duration';
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
                                        "Upload\nImage",
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
                                   Text('No image selected.',
                                  style: TextStyle(
                                    color: Provider.of<ThemeChanger>(context)
                                        .themeData ==
                                        darkMode
                                        ? const Color(0xffFFFFFF)
                                        : const Color(0XFFA2A2B5),
                                  ),),
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
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: 1,
                      // borderPadding: EdgeInsets.all(8),
                      radius: Radius.circular(MySize.size10),
                      padding: EdgeInsets.all(MySize.size8),
                      child: GestureDetector(
                        onTap: _pickDocument,
                        child: _filePath != null
                            ? Text(
                                textAlign: TextAlign.center,
                                'File path: $_filePath',
                                style: TextStyle(
                                  fontSize: MySize.size14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
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
                                     Text('No document selected.',
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                          darkMode
                                          ? const Color(0xffFFFFFF)
                                          : const Color(0XFFA2A2B5),
                                    ),),
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
                            'Monthly price',
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
                            child: TextFormField(
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
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "\$0.0",
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
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFF353542)
                                                : const Color(0XFF353542))),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFF353542)
                                                : const Color(0XFF353542))),
                              ),
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
                    return Consumer<CategoryProvider>(builder: (context, categoryProvider, child) {
                      return InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              subscriptionProvider.storeSubscription(
                                image: _imagePhoto,
                                document: _filePath ,
                                providerId: categoryProvider.subCategoryID,
                                description: descriptionController.text.trim(),
                                startDate: _dateFormat.format(_selectedDate!),
                                renewalDate: _dateFormat.format(_selectedDate1!),
                                billingCycle: billingValue.toString(),
                                categoryID: categoryProvider.categoryID,
                                price: _monthlyPriceController.text.trim(),
                                reminderDuration: remindDurationValue.toString(),
                              );
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
                                ? const Center(child: CircularProgressIndicator())
                                : Center(
                              child: Text(
                                'Add this subscription',
                                style: TextStyle(
                                  fontSize: MySize.size14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Regular-Poppins',
                                  color: Provider.of<ThemeChanger>(context)
                                      .themeData ==
                                      darkMode
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ));
                    },);
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
