import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/profile_provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/home_screen/Component/subscription_widget.dart';
import 'package:sub_tracker/views/home_screen/Component/up_coming_bill_widget.dart';
import 'package:sub_tracker/views/spending_budgets/spending_budgets.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../base/custom_container.dart';
import '../base/text_widgets.dart';

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
    Future.microtask(() => Provider.of<ProfileProvider>(context, listen: false)
        .getProfile(userID: ""));
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
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF1C1C23)
                : const Color(0XFFF7F7FF),
        body: Consumer<SubscriptionProvider>(
          builder: (context, subscriptionProvider, child) {
            var data;
            if (subscriptionProvider.subscriptionData['data'] != null) {
              data = subscriptionProvider.subscriptionData['data'];
            }
            return subscriptionProvider.isSubscription
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                : subscriptionProvider.subscriptionData['data'] == null
                    ? const Center(child: Text("datae are not available"))
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: CustomContainer(
                                activeSubscription: data['activesub'].toString()  == null ?data['activesub'].toString():"0",
                                highestSubscription: data['highsub'].toString() == null ?data['highsub'].toString():"0",
                                lowestSubscription: data['lowsub'].toString() == null ? data['lowsub'].toString():"0",
                                monthlyBill: data['monthlybill'].toString() == null ?data['monthlybill'].toString():"0",
                                totalBudget: data['totalBudget'].toString() == null ?data['totalBudget'].toString():"0",
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
                                    // horizontal: MySize.scaleFactorWidth * 9,
                                    vertical: MySize.scaleFactorHeight * 7),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size16),
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0XFF0E0E12)
                                      // ? Colors.orange
                                      : const Color(0XFFFFFFFF),
                                ),
                                child: TabBar(
                                  indicatorPadding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  indicator: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(MySize.size16),
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0xFF4E4E61)
                                            .withOpacity(0.20)
                                        : const Color(0xFFCFCFFC)
                                            .withOpacity(0.3),

                                  ),
                                  indicatorColor: Colors.transparent,
                                  controller: _tabController,
                                  unselectedLabelColor:
                                      Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? const Color(0XFFA2A2B5)
                                          : const Color(0XFFA2A2B5),
                                  labelColor: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0XFFFFFFFF)
                                      : const Color(0XFF424252),
                                  tabs: [
                                    Tab(
                                      child: Center(
                                        child: Text(
                                          'Your subscriptions',
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
                                          'Upcoming bills',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: MySize.size12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MySize.size100,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  data['subscriptions'].length == 0
                                      ? Center(
                                          child: Text(
                                            "No Data found",
                                            style: TextStyle(
                                                fontSize: MySize.size14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeChanger>(
                                                                    context)
                                                                .themeData ==
                                                            darkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        )
                                      : SubscriptionWidget(
                                          subscriptions: data['subscriptions'],
                                        ),
                                  data['upcommingbills'].length == 0
                                      ? Center(
                                          child: Text(
                                            "No Data found",
                                            style: TextStyle(
                                                fontSize: MySize.size14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeChanger>(
                                                                    context)
                                                                .themeData ==
                                                            darkMode
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        )
                                      : UpComingBillWidget(
                                          upComingBills: data['upcommingbills'])
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}
