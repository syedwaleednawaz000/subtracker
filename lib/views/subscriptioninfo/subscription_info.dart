import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/description_dialog.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/renewal_date.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/save_button.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/start_date.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/upload_document.dart';

import '../../Provider/subscription_provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import 'base/subscriptioninforow.dart';

class SubscriptionInfo extends StatefulWidget {
  Map<String, dynamic> subscriptionInfoData;

  SubscriptionInfo({required this.subscriptionInfoData, super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {


  String _name = "";
  String _descrip = "";
  String _selectedCategory = "";
  String _selectedReminder = "";
  String _selectedBilling = "";

  String _price = "";
  String _providerId = "";
  String _categoryId = "";
  String _subscriptionId = "";

// Function to assign values from the map to the variables
  void assignValues() {
    setState(() {
      // _name = widget.subscriptionInfoData['name'] ?? '';
      _name = widget.subscriptionInfoData['name'] ?? "";
      _descrip = widget.subscriptionInfoData['description'] ?? "";
      _selectedCategory =
          widget.subscriptionInfoData['category_id'].toString() ?? "";
      _selectedReminder = widget.subscriptionInfoData['reminder'] ?? "";
      _selectedBilling = widget.subscriptionInfoData['billing_cycle'] ?? "";
      // _startDate = widget.subscriptionInfoData['start_date'] ?? "";
      // _renDate = widget.subscriptionInfoData['renewal_date'] ?? "";
      _price = widget.subscriptionInfoData['price']?.toString() ?? "";
      _providerId = widget.subscriptionInfoData['provider_id'].toString() ?? "";
      _categoryId = widget.subscriptionInfoData['category_id'].toString() ?? "";
      _subscriptionId = widget.subscriptionInfoData['id'].toString() ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the function to assign values
    assignValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppBarInAll(leading: false,actions: true,title: "Subscription info",type: "delete",id: widget.subscriptionInfoData['id'].toString()),
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF0E0E12)
          : Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: MySize.size24,
          left: MySize.size24,
          right: MySize.size24,
        ),
        child: SizedBox(
            width: double.infinity,
            child: widget.subscriptionInfoData == null
                ? Center(
                    child: Text(
                      "data not found",
                      style: TextStyle(
                        fontSize: MySize.size12,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? const Color(0XFFA2A2B5)
                            : const Color(0XFF424252),
                      ),
                    ),
                  )
                : Container(

                  decoration: BoxDecoration(
                    color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                        ? const Color(0xFF353542)
                        : const Color(0xFFF1F1FF),
                    borderRadius: BorderRadius.circular(MySize.size24),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10,),
                          Column(
                            children: [
                              Image.asset(
                                AppImages.tresorlyIcon,
                                width: MySize.size100,
                                height: MySize.scaleFactorHeight * 127,
                              ),
                              SizedBox(height: MySize.size3),
                              Text(
                                "${widget.subscriptionInfoData['provider'] == null ? "unknown" : widget.subscriptionInfoData['provider']['name']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: MySize.size32,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Inter',
                                  color: Provider.of<ThemeChanger>(context)
                                      .themeData ==
                                      darkMode
                                      ? Colors.white
                                      : const Color(0xFF1C1C23),
                                ),
                              ),
                              // SizedBox(height: MySize.size2),
                              Text(
                                AppConstant.validatePrice(context: context,currencyCode: Provider.of<CurrencyProvider>(context,listen: false).selectedCurrencySymbol,price: double.parse(widget.subscriptionInfoData['price'] ?? "0")),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: MySize.size20,
                                  fontFamily: 'Inter',
                                  color: Provider.of<ThemeChanger>(context)
                                      .themeData ==
                                      darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFFA2A2B5),
                                ),
                              ),
                              SizedBox(height: MySize.scaleFactorHeight * 30),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: MySize.size20),
                                child: Column(
                                  children: [
                                    // SizedBox(height: MySize.size25),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: MySize.size20,
                                        vertical: MySize.size16,
                                      ),
                                      // width: MySize.scaleFactorWidth * 288,
                                      decoration: BoxDecoration(
                                        color:
                                        Provider.of<ThemeChanger>(context).themeData == darkMode
                                            ? const Color(0xFF4E4E61).withOpacity(.2)
                                            : const Color(0xFFF7F7FF),
                                        borderRadius: BorderRadius.circular(MySize.size16),
                                        border: Border.all(
                                          width: MySize.size2,
                                          color: Provider.of<ThemeChanger>(
                                              context)
                                              .themeData ==
                                              darkMode
                                              ? const Color(0XFFCFCFFC)
                                              .withOpacity(.15)
                                              : const Color(0XFFCFCFFC)
                                              .withOpacity(.15),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Consumer<CategoryProvider>(
                                            builder: (context, categoryProvider, child) {
                                              return  GestureDetector(
                                                onTap: () {
                                                  Provider.of<SubscriptionInfoProvider>(context,listen: false).showCategories(context: context,provider: categoryProvider);
                                                },
                                                child: Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
                                                  return SubscriptionInfoRow(
                                                    text: 'Category & name',
                                                    text2: subscriptionInfoProvider.categoryName,
                                                    icon: Image.asset(
                                                      AppImages.arrowLeft,
                                                      width: MySize.size14,
                                                      height: MySize.size14,
                                                      color: Provider.of<ThemeChanger>(
                                                          context)
                                                          .themeData ==
                                                          darkMode
                                                          ? const Color(0xFFA2A2B5)
                                                          : const Color(0xFFA2A2B5),
                                                    ),
                                                  );
                                                },),
                                              );
                                            },
                                          ),
                                          SizedBox(height: MySize.size20),
                                          GestureDetector(
                                            onTap: () {
                                              Provider.of<SubscriptionInfoProvider>(context,listen: false).showDescriptionDialog(context: context, oldValue: _descrip);
                                            },
                                            child: SubscriptionInfoRow(
                                              text: 'Description',
                                              text2: _descrip,
                                              icon: Image.asset(
                                                AppImages.arrowLeft,
                                                width: MySize.size14,
                                                height: MySize.size14,
                                                color: Provider.of<ThemeChanger>(
                                                    context)
                                                    .themeData ==
                                                    darkMode
                                                    ? const Color(0xFFA2A2B5)
                                                    : const Color(0xFFA2A2B5),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: MySize.size20),
                                          const StartDate(),
                                          SizedBox(height: MySize.size16),
                                          RenewalDate(),
                                          SizedBox(height: MySize.size16),
                                          GestureDetector(
                                            onTapDown:
                                                (TapDownDetails details) {
                                              _showBillingPopupMenu(context,
                                                  details.globalPosition);
                                            },
                                            child: SubscriptionInfoRow(
                                              text: 'Billing Cycle',
                                              text2: _selectedBilling,
                                              icon: Image.asset(
                                                AppImages.arrowLeft,
                                                width: MySize.size14,
                                                height: MySize.size14,
                                                color: Provider.of<ThemeChanger>(
                                                    context)
                                                    .themeData ==
                                                    darkMode
                                                    ? const Color(0xFFA2A2B5)
                                                    : const Color(0xFFA2A2B5),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: MySize.size16),
                                          GestureDetector(
                                            onTapDown:
                                                (TapDownDetails details) {
                                              _showRemiderPopupMenu(context,
                                                  details.globalPosition);
                                            },
                                            child: SubscriptionInfoRow(
                                              text: 'Reminder',
                                              text2: _selectedReminder,
                                              icon: Image.asset(
                                                AppImages.arrowLeft,
                                                width: MySize.size14,
                                                height: MySize.size14,
                                                color: Provider.of<ThemeChanger>(
                                                    context)
                                                    .themeData ==
                                                    darkMode
                                                    ? const Color(0XFFA2A2B5)
                                                    : const Color(0XFFA2A2B5),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: MySize.size26),
                                          const UploadDocument(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.size20,
                                    ),
                                    const SaveButtonInSubInfo(),
                                  ],
                                ),
                              )
                            ],
                          ),
                    ]),
                  ),
                )),
      ),
    );
  }

  void _showNameDialog(
      {required BuildContext context, required String nameOldValue}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();
        nameController.text = nameOldValue;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Enter Your Name'),
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    nameController.clear();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      _name = nameController.text.isEmpty
                          ? 'unknown'
                          : nameController.text;
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }


  void _showCategPopupMenu(BuildContext context, Offset tapPosition) async {
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
          value: 'Netflix',
          child: Text('Netflix'),
        ),
        const PopupMenuItem<String>(
          value: 'Amazon',
          child: Text('Amazon'),
        ),
        const PopupMenuItem<String>(
          value: 'Prime',
          child: Text('Prime'),
        ),
        const PopupMenuItem<String>(
          value: 'Disney+',
          child: Text('Disney+'),
        ),
      ],
      elevation: 8.0,
    );

    if (selected != null) {
      setState(() {
        _selectedCategory = selected;
      });
      print(_selectedCategory); // Handle menu selection
    }
  }

  void _showRemiderPopupMenu(BuildContext context, Offset tapPosition) async {
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
      ],
      elevation: 8.0,
    );

    if (selected != null) {
      setState(() {
        _selectedReminder = selected;
      });
      print(_selectedReminder); // Handle menu selection
    }
  }

  void _showBillingPopupMenu(BuildContext context, Offset tapPosition) async {
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
      ],
      elevation: 8.0,
    );

    if (selected != null) {
      setState(() {
        _selectedBilling = selected;
      });
      print(_selectedBilling); // Handle menu selection
    }
  }

}
