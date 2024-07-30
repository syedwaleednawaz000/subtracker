import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../Provider/subscription_provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import '../settings/settings.dart';
import 'base/subscriptioninforow.dart';

class SubscriptionInfo extends StatefulWidget {
  Map<String, dynamic> subscriptionInfoData;

  SubscriptionInfo({required this.subscriptionInfoData, super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {




  @override
  Widget build(BuildContext context) {
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
                                      subscriptionID: "18");
                                },
                                child: Image.asset(
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
                                  height:
                                  MySize.scaleFactorHeight * 370,
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
                                        text2:
                                        "${widget.subscriptionInfoData['provider'] == null ? "unknown" : widget.subscriptionInfoData['provider']['name']}",
                                        icon: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
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
                                        ),
                                      ),
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Description',
                                        text2:
                                        widget.subscriptionInfoData[
                                        'description'] ??
                                            "",
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Category',
                                        text2: "Netflix",
                                        icon: GestureDetector(
                                          onTap: () {
                                            print("pressed");
                                          },
                                          child: Image.asset(
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
                                        ),
                                      ),
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Start Date',
                                        text2:
                                        widget.subscriptionInfoData[
                                        'start_date'] ??
                                            "",
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Renewal Date',
                                        text2:
                                        widget.subscriptionInfoData[
                                        'renewal_date'] ??
                                            "",
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Billing Cycle',
                                        text2:
                                        widget.subscriptionInfoData[
                                        'billing_cycle'] ??
                                            "",
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
                                      SizedBox(height: MySize.size16),
                                      SubscriptionInfoRow(
                                        text: 'Reminder',
                                        text2:
                                        widget.subscriptionInfoData[
                                        'reminder'] ??
                                            "",
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
      bottomNavigationBar: Consumer<SubscriptionProvider>(
        builder: (context, getSubscriptionProvider, child) {
          return InkWell(
            onTap: () {
              getSubscriptionProvider.getSubscriptions();
            },
            child: Container(
              height: MySize.scaleFactorHeight * 48,
              margin: EdgeInsets.only(bottom: 18,right: 20,left: 20),
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
      ),
    );
  }
}