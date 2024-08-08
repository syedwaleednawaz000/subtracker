import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
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


  String _name = "Unknown";
  String _descrip = "Music App";
  String _selectedCategory = "Netflix";
  String _selectedReminder = "Reminder";
  String _selectedBilling = "Billing Reminder";
  String _startDate = "Start Date";
  String _renDate = "Renewal Date";


  @override
  Widget build(BuildContext context) {
    print("this is subsription data ${widget.subscriptionInfoData}");
    return Scaffold(
      backgroundColor:
      Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF0E0E12)
          : Colors.white,
      body:           Padding(
        padding: EdgeInsets.only(
          top: MySize.size24,
          left: MySize.size24,
          right: MySize.size24,
        ),
        child: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: widget.subscriptionInfoData == null
                  ? Center(
                child: Text(
                  "data not found",
                  style: TextStyle(
                    fontSize: MySize.size12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context)
                        .themeData ==
                        darkMode
                        ? const Color(0XFFA2A2B5)
                        : const Color(0XFF424252),
                  ),
                ),
              )
                  : SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeChanger>(context)
                        .themeData ==
                        darkMode
                        ? const Color(0XFF353542)
                        : const Color(0XFFF1F1FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size24),
                      topRight: Radius.circular(MySize.size24),
                    ),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MySize.size28,
                        vertical: MySize.size32,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: Image.asset(
                                AppImages.downwardArrow,
                                width: MySize.size20,
                                height: MySize.size20,
                                color: Provider.of<ThemeChanger>(
                                    context)
                                    .themeData ==
                                    darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFF424252),
                              ),
                            ),
                          ),

                          const Spacer(),
                          Text(
                            'Subscription info',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MySize.size16,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(
                                  context)
                                  .themeData ==
                                  darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFF424252),
                            ),
                          ),
                          const Spacer(), // Add Spacer here
                          Consumer<SubscriptionProvider>(
                            builder: (context,
                                subscriptionProvider, child) {
                              return GestureDetector(
                                onTap: () {
                                  subscriptionProvider
                                      .deleteSubscription(
                                      context: context,
                                      subscriptionID: widget.subscriptionInfoData['subscription']['category']['id'].toString());
                                },
                                child: subscriptionProvider.isDeleteSubscription? Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),): Image.asset(
                                  AppImages.trash,
                                  scale: 1.2,
                                  color: Provider.of<ThemeChanger>(
                                      context)
                                      .themeData ==
                                      darkMode
                                      ? const Color(0XFFA2A2B5)
                                      : const Color(0XFF424252),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      // height: MySize.scaleFactorHeight * 384,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context)
                            .themeData ==
                            darkMode
                            ? const Color(0XFF353542)
                            : const Color(0XFFF1F1FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MySize.size24),
                          topRight: Radius.circular(MySize.size24),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: MySize.size17),
                          Container(
                            height: MySize.scaleFactorHeight * 120,
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              // color: AppColors.primaryColor,
                              borderRadius:
                              BorderRadius.circular(MySize.size32),
                            ),
                            child: Image.asset(AppImages.tresorlyIcon),
                          ),
                          SizedBox(height: MySize.size6),
                          Text(
                            "${widget.subscriptionInfoData['provider'] == null ? "unknown" : widget.subscriptionInfoData['provider']['name']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MySize.size32,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context)
                                  .themeData ==
                                  darkMode
                                  ? Colors.white
                                  : const Color(0XFF1C1C23),
                            ),
                          ),
                          SizedBox(height: MySize.size2),
                          Text(
                            "\$ ${widget.subscriptionInfoData['price'] ?? ""}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: MySize.size20,
                              color: Provider.of<ThemeChanger>(context)
                                  .themeData ==
                                  darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFFA2A2B5),
                            ),
                          ),
                          SizedBox(height: MySize.scaleFactorHeight * 70),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: Provider.of<ThemeChanger>(context)
                                  .themeData ==
                                  darkMode
                                  ? const Color(0XFF353542)
                                  : const Color(0XFFF1F1FF),
                              borderRadius: BorderRadius.only(
                                bottomRight:
                                Radius.circular(MySize.size24),
                                bottomLeft:
                                Radius.circular(MySize.size24),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: MySize.size25),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: MySize.size20,
                                    vertical: MySize.size16,
                                  ),
                                  // height:
                                  // MySize.scaleFactorHeight * 370,
                                  width: MySize.scaleFactorWidth * 288,
                                  decoration: BoxDecoration(
                                    color: Provider.of<ThemeChanger>(
                                        context)
                                        .themeData ==
                                        darkMode
                                        ? const Color(0XFF4E4E61)
                                        .withOpacity(.2)
                                        : const Color(0XFFF7F7FF),
                                    borderRadius:
                                    BorderRadius.circular(16),
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
                                      SubscriptionInfoRow(
                                        text: 'Name',
                                        text2: _name,
                                        icon: GestureDetector(
                                          onTap: () {
                                            _showNameDialog(context: context);
                                          },
                                          child: Image.asset(
                                            AppImages.arrowLeft,
                                            width: MySize.size14,
                                            height: MySize.size14,
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Description',
                                        text2: _descrip,
                                        icon: GestureDetector(
                                          onTap: (){
                                            _showDescripDialog(context: context);
                                          },
                                          child: Image.asset(
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Category',
                                        text2: _selectedCategory,
                                        icon: GestureDetector(
                                          onTapDown: (TapDownDetails details) {
                                            _showCategPopupMenu(context, details.globalPosition);
                                          },
                                          child: Image.asset(
                                            AppImages.arrowLeft,
                                            width: MySize.size14,
                                            height: MySize.size14,
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFFA2A2B5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: MySize.size6),
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Start Date',
                                        text2:_startDate,
                                        icon: GestureDetector(
                                          onTap: () async {
                                            DateTime? selectedDate = await _selectDate(context);
                                            if (selectedDate != null) {
                                              setState(() {
                                                _startDate = "${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}";
                                              });
                                            }
                                          },
                                          child: Image.asset(
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Renewal Date',
                                        text2:_renDate,

                                        icon: GestureDetector(
                                          onTap: () async {
                                            DateTime? selectedDate = await _renewalDate(context);
                                            if (selectedDate != null) {
                                              setState(() {
                                                _renDate = "${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}";
                                              });
                                            }
                                          },
                                          child: Image.asset(
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Billing Cycle',
                                        text2: _selectedBilling,
                                        icon: GestureDetector(
                                          onTapDown: (TapDownDetails details) {
                                            _showBillingPopupMenu(context, details.globalPosition);
                                          },
                                          child: Image.asset(
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Reminder',
                                        text2:_selectedReminder,
                                        icon: GestureDetector(
                                          onTapDown: (TapDownDetails details) {
                                            _showRemiderPopupMenu(context, details.globalPosition);
                                          },
                                          child: Image.asset(
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
                                      DottedBorder(
                                        dashPattern: const [6, 6, 6, 6],
                                        color:
                                        Provider.of<ThemeChanger>(
                                            context)
                                            .themeData ==
                                            darkMode
                                            ? const Color(
                                            0XFF4E4E61)
                                            : const Color(
                                            0XFF4E4E61)
                                            .withOpacity(.5),
                                        strokeWidth: 1,
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(
                                            MySize.size12),
                                        child: SizedBox(
                                          height:
                                          MySize.scaleFactorHeight *
                                              61,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(
                                                'Upload documents',
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                  MySize.size14,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(
                                                      context)
                                                      .themeData ==
                                                      darkMode
                                                      ? const Color(
                                                      0XFFA2A2B5)
                                                      : const Color(
                                                      0XFFA2A2B5),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: MySize.size10),
                                              Container(
                                                height: MySize.size20,
                                                width: MySize.size20,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .transparent,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(90),
                                                  border: Border.all(
                                                    color: Provider.of<ThemeChanger>(
                                                        context)
                                                        .themeData ==
                                                        darkMode
                                                        ? const Color(
                                                        0XFFA2A2B5)
                                                        : const Color(
                                                        0XFFA2A2B5),
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Provider.of<ThemeChanger>(
                                                        context)
                                                        .themeData ==
                                                        darkMode
                                                        ? const Color(
                                                        0XFFA2A2B5)
                                                        : const Color(
                                                        0XFFA2A2B5),
                                                    size: MySize.size12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MySize.size20,),
                                Consumer<SubscriptionProvider>(
                                  builder: (context, getSubscriptionProvider, child) {
                                    return InkWell(
                                      onTap: () {
                                        getSubscriptionProvider.getSubscriptions();
                                      },
                                      child: Container(
                                        height: MySize.scaleFactorHeight * 48,
                                        margin: const EdgeInsets.only(bottom: 18,right: 20,left: 20),
                                        width: MySize.scaleFactorWidth * 288,
                                        decoration: BoxDecoration(
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              ? Colors.white.withOpacity(.1)
                                              : const Color(0XFFF7F7FF),
                                          borderRadius: BorderRadius.circular(MySize.size24),
                                          border: Border.all(
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? Colors.white.withOpacity(.15)
                                                : Colors.white.withOpacity(.15),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Save',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: MySize.size14,
                                              fontWeight: FontWeight.w600,
                                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                  ? const Color(0XFFFFFFFF)
                                                  : const Color(0XFF424252),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              )),
        ),
      ),
    );
  }
  void _showNameDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();

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
                      _name = nameController.text.isEmpty ? 'unknown' : nameController.text;
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
  void _showDescripDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController descripController = TextEditingController();

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Enter Description'),
              content: TextField(
                controller: descripController,
                decoration: const InputDecoration(hintText: "Description"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    descripController.clear(); // Clear the text field
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      _descrip = descripController.text.isEmpty ? 'Music App' : descripController.text;
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
    final selected =  await showMenu<String>(
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
        ),const PopupMenuItem<String>(
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
    final selected =  await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        tapPosition.dx,
        tapPosition.dy,
      ),
      items: [
         const PopupMenuItem<String>(
          value: '1 Week',
          child: Text("1 Week"),
        ),
         const PopupMenuItem<String>(
          value: '1 Month',
          child: Text('1 Month'),
        ),
         const PopupMenuItem<String>(
          value: '1 Year',
          child: Text('1 Year'),
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
    final selected =  await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        tapPosition.dy,
        tapPosition.dx,
        tapPosition.dy,
      ),
      items: [
         const PopupMenuItem<String>(
          value: '1 Week',
          child: Text("1 Week"),
        ),
         const PopupMenuItem<String>(
          value: '1 Month',
          child: Text('1 Month'),
        ),
         const PopupMenuItem<String>(
          value: '1 Year',
          child: Text('1 Year'),
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
  Future<DateTime?> _renewalDate(BuildContext context) async {
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
}



