import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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

  String _subscriptionId = "";

// Function to assign values from the map to the variables
  void assignValues() {
    setState(() {
      // _name = widget.subscriptionInfoData['name'] ?? '';
      // _name = widget.subscriptionInfoData['name'] ?? "";
      // _descrip = widget.subscriptionInfoData['description'] ?? "";
      // _selectedCategory  = widget.subscriptionInfoData['category_id'].toString() ?? "";
      // _selectedReminder = widget.subscriptionInfoData['reminder'] ?? "";
      // _selectedBilling = widget.subscriptionInfoData['billing_cycle'] ?? "";
      // _startDate = widget.subscriptionInfoData['start_date'] ?? "";
      // _renDate = widget.subscriptionInfoData['renewal_date'] ?? "";
      // _price = widget.subscriptionInfoData['price']?.toString() ?? "";
      // _providerId = widget.subscriptionInfoData['provider_id'].toString() ?? "";
      // _categoryId = widget.subscriptionInfoData['category_id'].toString() ?? "";
      _subscriptionId = widget.subscriptionInfoData['id'].toString() ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>     Provider.of<CategoryProvider>(context, listen: false).getAllCategory());
    // Call the function to assign values
    assignValues();
    Future.microtask(() =>     Provider.of<SubscriptionInfoProvider>(context,listen: false). setAllValue(
        price: widget.subscriptionInfoData['price']?.toString() ?? "",
        desc: widget.subscriptionInfoData['description'] ?? "",
        categoryName: widget.subscriptionInfoData['category']['name']?.toString() ?? "",
        categoryID: widget.subscriptionInfoData['category']['id']?.toString() ?? "",
        providerName: widget.subscriptionInfoData['provider']['name']?.toString() ?? "",
        providerID: widget.subscriptionInfoData['provider_id']?.toString() ?? "",
        startDate: widget.subscriptionInfoData['start_date'] ?? "",
        renewalDate: widget.subscriptionInfoData['renewal_date'] ?? "",
        billingRecycle: widget.subscriptionInfoData['billing_cycle'] ?? "",
        reminder: widget.subscriptionInfoData['reminder'] ?? ""
    ));
  }

  @override
  Widget build(BuildContext context) {
    print("this is sub dat ${widget.subscriptionInfoData.toString()}");
    return Scaffold(
      appBar: CustomAppBarInAll(
          leading: false,
          actions: true,
          title: "Subscription info",
          type: "delete",
          id: widget.subscriptionInfoData['id'].toString()),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                widget.subscriptionInfoData['provider']['image_icon'] != null?
                                ClipOval(
                                  child: buildImageWidget(imageUrl: widget.subscriptionInfoData['provider']['image_icon'].toString()),
                                ): Image.asset(
                                  AppImages.tresorlyIcon,
                                  width: MySize.size100,
                                  height: MySize.scaleFactorHeight * 127,
                                ),
                                SizedBox(height: MySize.size3),
                        Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
                          return Text(
                            subscriptionInfoProvider.subCategoryName.isEmpty ? "unknown" : subscriptionInfoProvider.subCategoryName!,
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
                          );
                        },),
                                // SizedBox(height: MySize.size2),
                                Text(
                                  AppConstant.validatePrice(
                                      context: context,
                                      currencyCode:
                                          Provider.of<CurrencyProvider>(context,
                                                  listen: false)
                                              .selectedCurrencySymbol,
                                      price: double.parse(widget
                                              .subscriptionInfoData['price'] ??
                                          "0")),
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
                                  padding: EdgeInsets.symmetric(horizontal: MySize.size20),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MySize.size20,
                                          vertical: MySize.size16,
                                        ),
                                        // width: MySize.scaleFactorWidth * 288,
                                        decoration: BoxDecoration(
                                          color:  Provider.of<ThemeChanger>(context).themeData == darkMode
                                                  ? const Color(0xFF4E4E61).withOpacity(.2)
                                                  : const Color(0xFFF7F7FF),
                                          borderRadius: BorderRadius.circular(
                                              MySize.size16),
                                          border: Border.all(
                                            width: MySize.size2,
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? const Color(0XFFCFCFFC).withOpacity(.15)
                                                : const Color(0XFFCFCFFC).withOpacity(.15),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Consumer<CategoryProvider>(
                                              builder: (context,
                                                  categoryProvider, child) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Provider.of<SubscriptionInfoProvider>(
                                                            context,
                                                            listen: false)
                                                        .showCategories(
                                                            context: context,
                                                            provider:
                                                                categoryProvider);
                                                  },
                                                  child: Consumer<
                                                      SubscriptionInfoProvider>(
                                                    builder: (context,
                                                        subscriptionInfoProvider,
                                                        child) {
                                                      return SubscriptionInfoRow(
                                                        text: 'Category & name',
                                                        text2:
                                                            subscriptionInfoProvider
                                                                .categoryName,
                                                        icon: Image.asset(
                                                          AppImages.arrowLeft,
                                                          width: MySize.size14,
                                                          height: MySize.size14,
                                                          color: Provider.of<ThemeChanger>(
                                                                          context)
                                                                      .themeData ==
                                                                  darkMode
                                                              ? const Color(
                                                                  0xFFA2A2B5)
                                                              : const Color(
                                                                  0xFFA2A2B5),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(height: MySize.size20),
                                            GestureDetector(
                                              onTap: () {
                                                Provider.of<SubscriptionInfoProvider>(context, listen: false).showDescriptionDialog(context: context,);
                                              },
                                              child: Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
                                                return SubscriptionInfoRow(
                                                  text: 'Description',
                                                  text2: subscriptionInfoProvider.descriptionController.text.trim(),
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
                                            ),
                                            SizedBox(height: MySize.size20),
                                            const StartDate(),
                                            SizedBox(height: MySize.size16),
                                            const RenewalDate(),
                                            SizedBox(height: MySize.size16),
                                            GestureDetector(
                                              onTapDown:
                                                  (TapDownDetails details) {
                                                Provider.of<SubscriptionInfoProvider>(context,listen: false).showBillingPopupMenu(context,details.globalPosition);
                                              },
                                              child: Consumer<
                                                  SubscriptionInfoProvider>(
                                                builder: (context,
                                                    subscriptionInfoProvider,
                                                    child) {
                                                  return SubscriptionInfoRow(
                                                    text: 'Billing Cycle',
                                                    text2:
                                                        subscriptionInfoProvider
                                                            .selectedBilling,
                                                    icon: Image.asset(
                                                      AppImages.arrowLeft,
                                                      width: MySize.size14,
                                                      height: MySize.size14,
                                                      color: Provider.of<ThemeChanger>(
                                                                      context)
                                                                  .themeData ==
                                                              darkMode
                                                          ? const Color(
                                                              0xFFA2A2B5)
                                                          : const Color(
                                                              0xFFA2A2B5),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(height: MySize.size16),
                                            GestureDetector(
                                              onTapDown:
                                                  (TapDownDetails details) {
                                                Provider.of<SubscriptionInfoProvider>(context,listen: false).showReminderPopupMenu(context, details.globalPosition);
                                              },
                                              child: Consumer<
                                                  SubscriptionInfoProvider>(
                                                builder: (context,
                                                    subscriptionInfoProvider,
                                                    child) {
                                                  return SubscriptionInfoRow(
                                                    text: 'Reminder',
                                                    text2:
                                                        subscriptionInfoProvider
                                                            .selectedReminder,
                                                    icon: Image.asset(
                                                      AppImages.arrowLeft,
                                                      width: MySize.size14,
                                                      height: MySize.size14,
                                                      color: Provider.of<ThemeChanger>(
                                                                      context)
                                                                  .themeData ==
                                                              darkMode
                                                          ? const Color(
                                                              0XFFA2A2B5)
                                                          : const Color(
                                                              0XFFA2A2B5),
                                                    ),
                                                  );
                                                },
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
                                       SaveButtonInSubInfo(subscriptionId: _subscriptionId),
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


  Widget buildImageWidget({required String imageUrl}) {
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      // Show SVG image
      return SvgPicture.network(
        imageUrl,
        width: MySize.size100,
        height: MySize.scaleFactorHeight * 127,
        placeholderBuilder: (context) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: MySize.size100,
            height: MySize.scaleFactorHeight * 127,
            color: Colors.grey[300],
          ),
        ),
        // errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 40, color: Colors.red),
      );
    } else {
      // Show CachedNetworkImage for non-SVG images
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: MySize.size100,
        height: MySize.scaleFactorHeight * 127,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: MySize.size100,
            height: MySize.scaleFactorHeight * 127,
            color: Colors.grey[300],
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error, size: 40, color: Colors.red),
      );
    }
  }


}
