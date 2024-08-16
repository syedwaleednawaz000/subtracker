import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  FilePickerResult? _filePath;

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
      ],
    );
    if (result != null) {
      setState(() {
        _filePath = result;
      });
    }
  }

  String _name = "";
  String _descrip = "";
  String _selectedCategory = "";
  String _selectedReminder = "";
  String _selectedBilling = "";
  String _startDate = "";
  String _renDate = "";
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
      _startDate = widget.subscriptionInfoData['start_date'] ?? "";
      _renDate = widget.subscriptionInfoData['renewal_date'] ?? "";
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
    print("this is subsription data ${widget.subscriptionInfoData}");
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF0E0E12)
          : Colors.white,
      body: Padding(
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
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0xFFA2A2B5)
                                        : const Color(0xFF424252),
                                  ),
                                ),
                              ),
                                        
                              const Spacer(),
                              Text(
                                'Subscription info',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: MySize.size16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFF424252),
                                ),
                              ),
                              const Spacer(), // Add Spacer here
                              Consumer<SubscriptionProvider>(
                                builder:
                                    (context, subscriptionProvider, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      subscriptionProvider.deleteSubscription(
                                          context: context,
                                          subscriptionID: widget
                                              .subscriptionInfoData['id']
                                              .toString());
                                    },
                                    child: subscriptionProvider
                                            .isDeleteSubscription
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.purpleFF,
                                            ),
                                          )
                                        : Image.asset(
                                            AppImages.trash,
                                            scale: 1.2,
                                            color: Provider.of<ThemeChanger>(
                                                            context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0xFFA2A2B5)
                                                : const Color(0xFF424252),
                                          ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
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
                                  "\$ ${widget.subscriptionInfoData['price'] ?? ""}",
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
                                          Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                              darkMode
                                              ? const Color(0xFF4E4E61)
                                              .withOpacity(.2)
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
                                            GestureDetector(
                                              onTap: () {
                                                _showDescripDialog(
                                                    context: context,
                                                    oldValue: _descrip);
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
                                            // SizedBox(height: MySize.size6),
                                            SizedBox(height: MySize.size20),
                                            GestureDetector(
                                              onTap: () async {
                                                DateTime? selectedDate =
                                                await _selectDate(context);
                                                final DateFormat dateFormat =
                                                DateFormat('dd-MM-yyyy');
                                                if (selectedDate != null) {
                                                  setState(() {
                                                    _startDate = dateFormat
                                                        .format(selectedDate);
                                                  });
                                                }
                                              },
                                              child: SubscriptionInfoRow(
                                                text: 'Start Date',
                                                text2: _startDate,
                                                icon: Image.asset(
                                                  AppImages.arrowLeft,
                                                  width: MySize.size12,
                                                  height: MySize.size12,
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
                                              onTap: () async {
                                                DateTime? selectedDate = await _renewalDate(context);
                                                final DateFormat dateFormat = DateFormat('dd-MM-yyyy'); // Updated format
                                                if (selectedDate != null) {
                                                  setState(() {
                                                    _renDate = dateFormat.format(selectedDate);
                                                  });
                                                }
                                              },
                                              child: SubscriptionInfoRow(
                                                text: 'Renewal Date',
                                                text2: _renDate,
                                                icon: Image.asset(
                                                  AppImages.arrowLeft,
                                                  width: MySize.size14,
                                                  height: MySize.size14,
                                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                      ? const Color(0xFFA2A2B5)
                                                      : const Color(0xFFA2A2B5),
                                                ),
                                              ),
                                            ),

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
                                            GestureDetector(
                                              onTap: () async {
                                                await _pickFiles();
                                              },
                                              child: _filePath == null
                                                  ? DottedBorder(
                                                dashPattern: const [
                                                  6,
                                                  6,
                                                  6,
                                                  6
                                                ],
                                                color: Provider.of<ThemeChanger>(
                                                    context)
                                                    .themeData ==
                                                    darkMode
                                                    ? const Color(
                                                    0XFF4E4E61)
                                                    : const Color(
                                                    0XFF4E4E61)
                                                    .withOpacity(.5),
                                                strokeWidth: 1,
                                                borderType:
                                                BorderType.RRect,
                                                radius: Radius.circular(
                                                    MySize.size12),
                                                child: SizedBox(
                                                  height: MySize
                                                      .scaleFactorHeight *
                                                      61,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                        'Upload documents',
                                                        textAlign:
                                                        TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                          fontSize: MySize
                                                              .size14,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color: Provider.of<ThemeChanger>(context)
                                                              .themeData ==
                                                              darkMode
                                                              ? const Color(
                                                              0XFFA2A2B5)
                                                              : const Color(
                                                              0XFFA2A2B5),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MySize
                                                              .size10),
                                                      Container(
                                                        height:
                                                        MySize.size20,
                                                        width:
                                                        MySize.size20,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              90),
                                                          border:
                                                          Border.all(
                                                            color: Provider.of<ThemeChanger>(context)
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
                                                            color: Provider.of<ThemeChanger>(context)
                                                                .themeData ==
                                                                darkMode
                                                                ? const Color(
                                                                0XFFA2A2B5)
                                                                : const Color(
                                                                0XFFA2A2B5),
                                                            size: MySize
                                                                .size12,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                                  : Text(
                                                textAlign:
                                                TextAlign.center,
                                                'File path: $_filePath',
                                                style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: MySize.size20,
                                      ),
                                      Consumer<SubscriptionProvider>(
                                        builder: (context, subscriptionProvider,
                                            child) {
                                          return InkWell(
                                            onTap: () {
                                              subscriptionProvider
                                                  .updateSubscription(
                                                  context: context,
                                                  subscriptionID:
                                                  _subscriptionId,
                                                  description: _descrip,
                                                  startDate: _startDate,
                                                  renewalDate: _renDate,
                                                  billingCycle:
                                                  _selectedBilling,
                                                  price: _price,
                                                  reminderDuration:
                                                  _selectedReminder,
                                                  categoryID:
                                                  _selectedCategory,
                                                  providerId: _providerId,
                                                  image: _filePath);
                                            },
                                            child: Container(
                                              height:
                                              MySize.scaleFactorHeight * 48,
                                              margin: const EdgeInsets.only(
                                                  bottom: 18,
                                                  right: 20,
                                                  left: 20),
                                              width:
                                              MySize.scaleFactorWidth * 288,
                                              decoration: BoxDecoration(
                                                color:
                                                Provider.of<ThemeChanger>(
                                                    context)
                                                    .themeData ==
                                                    darkMode
                                                    ? Colors.white
                                                    .withOpacity(.1)
                                                    : const Color(
                                                    0XFFF7F7FF),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    MySize.size24),
                                                border: Border.all(
                                                  color:
                                                  Provider.of<ThemeChanger>(
                                                      context)
                                                      .themeData ==
                                                      darkMode
                                                      ? Colors.white
                                                      .withOpacity(.15)
                                                      : Colors.white
                                                      .withOpacity(.15),
                                                ),
                                              ),
                                              child: Center(
                                                child: subscriptionProvider
                                                    .isUpdateSub
                                                    ? const CircularProgressIndicator(
                                                  color:
                                                  AppColors.purpleFF,
                                                )
                                                    : Text(
                                                  'Save',
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
                                                        0XFFFFFFFF)
                                                        : const Color(
                                                        0XFF424252),
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

                        // Container(
                        //   // height: MySize.scaleFactorHeight * 384,
                        //
                        //   decoration: BoxDecoration(
                        //     color: Provider.of<ThemeChanger>(context)
                        //                 .themeData ==
                        //             darkMode
                        //         ? const Color(0xFF353542)
                        //         : const Color(0xFFF1F1FF),
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(MySize.size24),
                        //       topRight: Radius.circular(MySize.size24),
                        //     ),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Image.asset(
                        //         AppImages.tresorlyIcon,
                        //         width: MySize.size100,
                        //         height: MySize.scaleFactorHeight * 127,
                        //       ),
                        //       SizedBox(height: MySize.size3),
                        //       Text(
                        //         "${widget.subscriptionInfoData['provider'] == null ? "unknown" : widget.subscriptionInfoData['provider']['name']}",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //           fontSize: MySize.size32,
                        //           fontWeight: FontWeight.w700,
                        //           fontFamily: 'Inter',
                        //           color: Provider.of<ThemeChanger>(context)
                        //                       .themeData ==
                        //                   darkMode
                        //               ? Colors.white
                        //               : const Color(0xFF1C1C23),
                        //         ),
                        //       ),
                        //       // SizedBox(height: MySize.size2),
                        //       Text(
                        //         "\$ ${widget.subscriptionInfoData['price'] ?? ""}",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: MySize.size20,
                        //           fontFamily: 'Inter',
                        //           color: Provider.of<ThemeChanger>(context)
                        //                       .themeData ==
                        //                   darkMode
                        //               ? const Color(0xFFA2A2B5)
                        //               : const Color(0xFFA2A2B5),
                        //         ),
                        //       ),
                        //       SizedBox(height: MySize.scaleFactorHeight * 30),
                        //       Container(
                        //         // clipBehavior: Clip.hardEdge,
                        //         decoration: BoxDecoration(
                        //           color: Provider.of<ThemeChanger>(context)
                        //                       .themeData ==
                        //                   darkMode
                        //               ? const Color(0xFF353542)
                        //               : const Color(0xFFF1F1FF),
                        //           borderRadius: BorderRadius.only(
                        //             bottomLeft: Radius.circular(MySize.size24),
                        //             bottomRight: Radius.circular(MySize.size24),
                        //           ),
                        //         ),
                        //         child: Padding(
                        //           padding:  EdgeInsets.symmetric(horizontal: MySize.size20),
                        //           child: Column(
                        //             children: [
                        //               // SizedBox(height: MySize.size25),
                        //               Container(
                        //                 padding: EdgeInsets.symmetric(
                        //                   horizontal: MySize.size20,
                        //                   vertical: MySize.size16,
                        //                 ),
                        //                 // width: MySize.scaleFactorWidth * 288,
                        //                 decoration: BoxDecoration(
                        //                   color:
                        //                       Provider.of<ThemeChanger>(context)
                        //                                   .themeData ==
                        //                               darkMode
                        //                           ? const Color(0xFF4E4E61)
                        //                               .withOpacity(.2)
                        //                           : const Color(0xFFF7F7FF),
                        //                   borderRadius: BorderRadius.only(
                        //                     bottomLeft: Radius.circular(MySize.size24),
                        //                     bottomRight: Radius.circular(MySize.size24),
                        //                   ),
                        //                   border: Border.all(
                        //                     width: MySize.size2,
                        //                     color: Provider.of<ThemeChanger>(
                        //                                     context)
                        //                                 .themeData ==
                        //                             darkMode
                        //                         ? const Color(0XFFCFCFFC)
                        //                             .withOpacity(.15)
                        //                         : const Color(0XFFCFCFFC)
                        //                             .withOpacity(.15),
                        //                   ),
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.start,
                        //                   children: [
                        //                     GestureDetector(
                        //                       onTap: () {
                        //                         _showDescripDialog(
                        //                             context: context,
                        //                             oldValue: _descrip);
                        //                       },
                        //                       child: SubscriptionInfoRow(
                        //                         text: 'Description',
                        //                         text2: _descrip,
                        //                         icon: Image.asset(
                        //                           AppImages.arrowLeft,
                        //                           width: MySize.size14,
                        //                           height: MySize.size14,
                        //                           color: Provider.of<ThemeChanger>(
                        //                                           context)
                        //                                       .themeData ==
                        //                                   darkMode
                        //                               ? const Color(0xFFA2A2B5)
                        //                               : const Color(0xFFA2A2B5),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     // SizedBox(height: MySize.size6),
                        //                     SizedBox(height: MySize.size20),
                        //                     GestureDetector(
                        //                       onTap: () async {
                        //                         DateTime? selectedDate =
                        //                             await _selectDate(context);
                        //                         final DateFormat dateFormat =
                        //                             DateFormat('dd-MM-yyyy');
                        //                         if (selectedDate != null) {
                        //                           setState(() {
                        //                             _startDate = dateFormat
                        //                                 .format(selectedDate);
                        //                           });
                        //                         }
                        //                       },
                        //                       child: SubscriptionInfoRow(
                        //                         text: 'Start Date',
                        //                         text2: _startDate,
                        //                         icon: Image.asset(
                        //                           AppImages.arrowLeft,
                        //                           width: MySize.size12,
                        //                           height: MySize.size12,
                        //                           color: Provider.of<ThemeChanger>(
                        //                                           context)
                        //                                       .themeData ==
                        //                                   darkMode
                        //                               ? const Color(0xFFA2A2B5)
                        //                               : const Color(0xFFA2A2B5),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(height: MySize.size16),
                        //                     GestureDetector(
                        //                       onTap: () async {
                        //                         DateTime? selectedDate = await _renewalDate(context);
                        //                         final DateFormat dateFormat = DateFormat('dd-MM-yyyy'); // Updated format
                        //                         if (selectedDate != null) {
                        //                           setState(() {
                        //                             _renDate = dateFormat.format(selectedDate);
                        //                           });
                        //                         }
                        //                       },
                        //                       child: SubscriptionInfoRow(
                        //                         text: 'Renewal Date',
                        //                         text2: _renDate,
                        //                         icon: Image.asset(
                        //                           AppImages.arrowLeft,
                        //                           width: MySize.size14,
                        //                           height: MySize.size14,
                        //                           color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        //                               ? const Color(0xFFA2A2B5)
                        //                               : const Color(0xFFA2A2B5),
                        //                         ),
                        //                       ),
                        //                     ),
                        //
                        //                     SizedBox(height: MySize.size16),
                        //                     GestureDetector(
                        //                       onTapDown:
                        //                           (TapDownDetails details) {
                        //                         _showBillingPopupMenu(context,
                        //                             details.globalPosition);
                        //                       },
                        //                       child: SubscriptionInfoRow(
                        //                         text: 'Billing Cycle',
                        //                         text2: _selectedBilling,
                        //                         icon: Image.asset(
                        //                           AppImages.arrowLeft,
                        //                           width: MySize.size14,
                        //                           height: MySize.size14,
                        //                           color: Provider.of<ThemeChanger>(
                        //                                           context)
                        //                                       .themeData ==
                        //                                   darkMode
                        //                               ? const Color(0xFFA2A2B5)
                        //                               : const Color(0xFFA2A2B5),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(height: MySize.size16),
                        //                     GestureDetector(
                        //                       onTapDown:
                        //                           (TapDownDetails details) {
                        //                         _showRemiderPopupMenu(context,
                        //                             details.globalPosition);
                        //                       },
                        //                       child: SubscriptionInfoRow(
                        //                         text: 'Reminder',
                        //                         text2: _selectedReminder,
                        //                         icon: Image.asset(
                        //                           AppImages.arrowLeft,
                        //                           width: MySize.size14,
                        //                           height: MySize.size14,
                        //                           color: Provider.of<ThemeChanger>(
                        //                                           context)
                        //                                       .themeData ==
                        //                                   darkMode
                        //                               ? const Color(0XFFA2A2B5)
                        //                               : const Color(0XFFA2A2B5),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(height: MySize.size26),
                        //                     GestureDetector(
                        //                       onTap: () async {
                        //                         await _pickFiles();
                        //                       },
                        //                       child: _filePath == null
                        //                           ? DottedBorder(
                        //                               dashPattern: const [
                        //                                 6,
                        //                                 6,
                        //                                 6,
                        //                                 6
                        //                               ],
                        //                               color: Provider.of<ThemeChanger>(
                        //                                               context)
                        //                                           .themeData ==
                        //                                       darkMode
                        //                                   ? const Color(
                        //                                       0XFF4E4E61)
                        //                                   : const Color(
                        //                                           0XFF4E4E61)
                        //                                       .withOpacity(.5),
                        //                               strokeWidth: 1,
                        //                               borderType:
                        //                                   BorderType.RRect,
                        //                               radius: Radius.circular(
                        //                                   MySize.size12),
                        //                               child: SizedBox(
                        //                                 height: MySize
                        //                                         .scaleFactorHeight *
                        //                                     61,
                        //                                 child: Row(
                        //                                   mainAxisAlignment:
                        //                                       MainAxisAlignment
                        //                                           .center,
                        //                                   children: [
                        //                                     Text(
                        //                                       'Upload documents',
                        //                                       textAlign:
                        //                                           TextAlign
                        //                                               .center,
                        //                                       style: TextStyle(
                        //                                         fontSize: MySize
                        //                                             .size14,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .w600,
                        //                                         color: Provider.of<ThemeChanger>(context)
                        //                                                     .themeData ==
                        //                                                 darkMode
                        //                                             ? const Color(
                        //                                                 0XFFA2A2B5)
                        //                                             : const Color(
                        //                                                 0XFFA2A2B5),
                        //                                       ),
                        //                                     ),
                        //                                     SizedBox(
                        //                                         width: MySize
                        //                                             .size10),
                        //                                     Container(
                        //                                       height:
                        //                                           MySize.size20,
                        //                                       width:
                        //                                           MySize.size20,
                        //                                       decoration:
                        //                                           BoxDecoration(
                        //                                         color: Colors
                        //                                             .transparent,
                        //                                         borderRadius:
                        //                                             BorderRadius
                        //                                                 .circular(
                        //                                                     90),
                        //                                         border:
                        //                                             Border.all(
                        //                                           color: Provider.of<ThemeChanger>(context)
                        //                                                       .themeData ==
                        //                                                   darkMode
                        //                                               ? const Color(
                        //                                                   0XFFA2A2B5)
                        //                                               : const Color(
                        //                                                   0XFFA2A2B5),
                        //                                           width: 2,
                        //                                         ),
                        //                                       ),
                        //                                       child: Center(
                        //                                         child: Icon(
                        //                                           Icons.add,
                        //                                           color: Provider.of<ThemeChanger>(context)
                        //                                                       .themeData ==
                        //                                                   darkMode
                        //                                               ? const Color(
                        //                                                   0XFFA2A2B5)
                        //                                               : const Color(
                        //                                                   0XFFA2A2B5),
                        //                                           size: MySize
                        //                                               .size12,
                        //                                         ),
                        //                                       ),
                        //                                     ),
                        //                                   ],
                        //                                 ),
                        //                               ),
                        //                             )
                        //                           : Text(
                        //                               textAlign:
                        //                                   TextAlign.center,
                        //                               'File path: $_filePath',
                        //                               style: TextStyle(
                        //                                 fontSize: MySize.size14,
                        //                                 fontWeight:
                        //                                     FontWeight.w400,
                        //                                 color: Colors.grey,
                        //                               ),
                        //                             ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 height: MySize.size20,
                        //               ),
                        //               Consumer<SubscriptionProvider>(
                        //                 builder: (context, subscriptionProvider,
                        //                     child) {
                        //                   return InkWell(
                        //                     onTap: () {
                        //                       subscriptionProvider
                        //                           .updateSubscription(
                        //                               context: context,
                        //                               subscriptionID:
                        //                                   _subscriptionId,
                        //                               description: _descrip,
                        //                               startDate: _startDate,
                        //                               renewalDate: _renDate,
                        //                               billingCycle:
                        //                                   _selectedBilling,
                        //                               price: _price,
                        //                               reminderDuration:
                        //                                   _selectedReminder,
                        //                               categoryID:
                        //                                   _selectedCategory,
                        //                               providerId: _providerId,
                        //                               image: _filePath);
                        //                     },
                        //                     child: Container(
                        //                       height:
                        //                           MySize.scaleFactorHeight * 48,
                        //                       margin: const EdgeInsets.only(
                        //                           bottom: 18,
                        //                           right: 20,
                        //                           left: 20),
                        //                       width:
                        //                           MySize.scaleFactorWidth * 288,
                        //                       decoration: BoxDecoration(
                        //                         color:
                        //                             Provider.of<ThemeChanger>(
                        //                                             context)
                        //                                         .themeData ==
                        //                                     darkMode
                        //                                 ? Colors.white
                        //                                     .withOpacity(.1)
                        //                                 : const Color(
                        //                                     0XFFF7F7FF),
                        //                         borderRadius:
                        //                             BorderRadius.circular(
                        //                                 MySize.size24),
                        //                         border: Border.all(
                        //                           color:
                        //                               Provider.of<ThemeChanger>(
                        //                                               context)
                        //                                           .themeData ==
                        //                                       darkMode
                        //                                   ? Colors.white
                        //                                       .withOpacity(.15)
                        //                                   : Colors.white
                        //                                       .withOpacity(.15),
                        //                         ),
                        //                       ),
                        //                       child: Center(
                        //                         child: subscriptionProvider
                        //                                 .isUpdateSub
                        //                             ? const CircularProgressIndicator(
                        //                                 color:
                        //                                     AppColors.purpleFF,
                        //                               )
                        //                             : Text(
                        //                                 'Save',
                        //                                 textAlign:
                        //                                     TextAlign.center,
                        //                                 style: TextStyle(
                        //                                   fontSize:
                        //                                       MySize.size14,
                        //                                   fontWeight:
                        //                                       FontWeight.w600,
                        //                                   color: Provider.of<ThemeChanger>(
                        //                                                   context)
                        //                                               .themeData ==
                        //                                           darkMode
                        //                                       ? const Color(
                        //                                           0XFFFFFFFF)
                        //                                       : const Color(
                        //                                           0XFF424252),
                        //                                 ),
                        //                               ),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ]),
                    ),
                  )),
        ),
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

  void _showDescripDialog(
      {required BuildContext context, required String oldValue}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController descriptionController = TextEditingController();
        descriptionController.text = oldValue;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Enter Description'),
              content: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: "Description"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onPressed: () {
                    descriptionController.clear(); // Clear the text field
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
                      _descrip = descriptionController.text.trim();
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
