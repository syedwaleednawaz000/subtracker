import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/base/linecolor_container.dart';
import 'package:sub_tracker/views/home_screen/Component/subscription_widget.dart';
import 'package:sub_tracker/views/home_screen/Component/up_coming_bill_widget.dart';

import '../../theme/theme.dart';
import '../base/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSelected = false;

  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<SubscriptionProvider>(context, listen: false)
            .getSubscriptions());
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor:
                    Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFF4E4E61)
                        : const Color(0XFFF1F1FF),
                titlePadding:
                    EdgeInsets.only(top: MySize.size30, left: MySize.size120),
                title: Text(
                  AppLocalizations.of(context)!.exit_app,
                  style: TextStyle(
                    fontSize: MySize.size18,
                    fontWeight: FontWeight.w600,
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Colors.white
                            : const Color(0XFF424252),
                  ),
                ),
                content: Text(
                  AppLocalizations.of(context)!
                      .do_you_really_want_to_exit_the_app,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w400,
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Colors.white
                            : const Color(0XFF424252),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          AppLocalizations.of(context)!.no,
                          style: TextStyle(
                            fontSize: MySize.size18,
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0XFFC54646) // #2B83F2
                                    : const Color(0XFFC54646),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => exit(0),
                        child: Text(
                          AppLocalizations.of(context)!.yes,
                          style: TextStyle(
                            fontSize: MySize.size18,
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0XFF2B83F2) // #
                                    : const Color(0XFF2B83F2),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ) ??
            false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor:
              Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? Colors.black
                  : const Color(0XFFFFFFFF),
          body: Consumer<SubscriptionProvider>(
            builder: (context, subscriptionProvider, child) {
              var data;
              if (subscriptionProvider.subscriptionData['data'] != null) {
                data = subscriptionProvider.subscriptionData['data'];
              }
              return subscriptionProvider.isSubscription
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.purpleFF,
                      ),
                    )
                  : subscriptionProvider.subscriptionData['data'] == null
                      ? Center(
                          child: Text(AppLocalizations.of(context)!
                              .data_are_not_available))
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 410,
                                child: Stack(
                                  children: [
                                    CustomContainer(
                                      activeSubscription:
                                          data['activesub'].toString() == null
                                              ? data['activesub'].toString()
                                              : "0",
                                      highestSubscription:
                                          data['highsub'].toString() == null
                                              ? data['highsub'].toString()
                                              : "0",
                                      lowestSubscription:
                                          data['lowsub'].toString() == null
                                              ? data['lowsub'].toString()
                                              : "0",
                                      monthlyBill:
                                          data['monthlybill'].toString() == null
                                              ? data['monthlybill'].toString()
                                              : "0",
                                      totalBudget:
                                          data['totalBudget'].toString() == null
                                              ? data['totalBudget'].toString()
                                              : "0",
                                    ),
                                    Positioned(
                                      bottom: -40,
                                      left: MySize.size23,
                                      child: Container(
                                        height: 125,
                                        // margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.black
                                                  : const Color(0XFFFFFFFF),
                                          borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.circular(MySize.size25),
                                            bottomLeft:
                                                Radius.circular(MySize.size25),
                                          ),
                                        ),
                                        padding: EdgeInsets.only(
                                            bottom:
                                                MySize.scaleFactorHeight * 15),
                                        child: Consumer<CurrencyProvider>(
                                          builder:
                                              (context, currencyProvider, child) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LineColorContainer(
                                                  borderColor:
                                                      const Color(0xFF758AFF),
                                                  titleText: AppLocalizations.of(
                                                          context)!
                                                      .active_subs,
                                                  numberCount:
                                                      AppConstant.validatePrice(
                                                          context: context,
                                                          price: double.parse(
                                                            data['activesub']
                                                                        .toString() ==
                                                                    null
                                                                ? data['highsub']
                                                                    .toString()
                                                                : "0",
                                                          )),
                                                ),
                                                SizedBox(
                                                  width: MySize.scaleFactorWidth *
                                                      14,
                                                ),
                                                LineColorContainer(
                                                  borderColor:
                                                      const Color(0xFFDC23FF),
                                                  titleText: AppLocalizations.of(
                                                          context)!
                                                      .highest_subs,
                                                  numberCount:
                                                      AppConstant.validatePrice(
                                                          context: context,
                                                          price: double.parse(
                                                            data['highsub']
                                                                        .toString() ==
                                                                    null
                                                                ? data['highsub']
                                                                    .toString()
                                                                : "0",
                                                          )),
                                                ),
                                                const SizedBox(
                                                  width: 14,
                                                ),
                                                LineColorContainer(
                                                  borderColor:
                                                      AppColors.accentLine,
                                                  titleText: AppLocalizations.of(
                                                          context)!
                                                      .lowest_subs,
                                                  numberCount:
                                                      AppConstant.validatePrice(
                                                          context: context,
                                                          price: double.parse(
                                                            data['lowsub']
                                                                        .toString() ==
                                                                    null
                                                                ? data['highsub']
                                                                    .toString()
                                                                : "0",
                                                          )),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MySize.scaleFactorHeight * 21,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MySize.size24),
                                child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        vertical: MySize.scaleFactorHeight * 7),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size16),
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0xFF0E0E12)
                                          // ? Colors.orange
                                          : const Color(0xFFCFCFFC)
                                              .withOpacity(0.3),
                                    ),
                                    child: TabBar(
                                      dividerColor: Colors.transparent,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 3),
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            MySize.size16),
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0xFF4E4E61)
                                                    .withOpacity(0.20)
                                                : Colors.white,
                                      ),
                                      indicatorColor: Colors.transparent,
                                      // Ensures no default indicator line is shown
                                      controller: _tabController,
                                      unselectedLabelColor:
                                          Provider.of<ThemeChanger>(context)
                                                      .themeData ==
                                                  darkMode
                                              ? const Color(0XFFA2A2B5)
                                              : const Color(0XFFA2A2B5),
                                      labelColor:
                                          Provider.of<ThemeChanger>(context)
                                                      .themeData ==
                                                  darkMode
                                              ? const Color(0XFFFFFFFF)
                                              : const Color(0XFF424252),
                                      tabs: [
                                        Tab(
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .your_subscriptions,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: MySize.size12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .upcoming_bills,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: MySize.size12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: MySize.size200,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    data['subscriptions'].length == 0
                                        ? Center(
                                            child: Text(
                                              AppLocalizations.of(context)!.your_subscriptions_are_not_available,
                                              style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.symmetric(horizontal: MySize.size20),
                                            child: ListView.builder(
                                              // shrinkWrap: true,
                                              physics: const BouncingScrollPhysics(),
                                              itemCount: data['subscriptions'].length,
                                              itemBuilder: (context, index) {
                                                return SubscriptionWidget(
                                                  subscriptions: data['subscriptions'][index],
                                                );
                                              },
                                            )),
                                    data['upcommingbills'].length == 0
                                        ? Center(
                                            child: Text(AppLocalizations.of(context)!.your_upcoming_bills_are_not_available,
                                              style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                          ? Colors.white
                                                          : Colors.black),
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: MySize.size20),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: data['upcommingbills'].length,
                                              itemBuilder: (context, index) {
                                                var finalData = data['upcommingbills'][index];
                                                return UpComingBillWidget(
                                                    upComingBills: finalData);
                                              },
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
