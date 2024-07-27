import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
 bool isSelected = false;
  @override
  void initState() {
    Future.microtask(() => Provider.of<SubscriptionProvider>(context,listen: false).getSubscriptions());
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
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF1C1C23)
            : const Color(0XFFF7F7FF),
          body: Consumer<SubscriptionProvider>(builder: (context, subscriptionProvider, child) {
            var data;
            if(subscriptionProvider.subscriptionData['data'] != null){
               data  = subscriptionProvider.subscriptionData['data'];
            }
            return   subscriptionProvider.isSubscription ?
            const Center(child: CircularProgressIndicator(color: Colors.green,),):
            subscriptionProvider.subscriptionData['data'] == null?
            const Center(child: Text("datae are not available")):
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: CustomContainer(
                      activeSubscription: data['activesub'].toString(),
                      highestSubscription: data['highsub'].toString(),
                      lowestSubscription: data['lowsub'].toString(),
                      monthlyBill: data['monthlybill'].toString(),
                      totalBudget: data['totalBudget'].toString(),
                    ),
                  ),

                  SizedBox(height: MySize.size10,),
                  Container(
                    width: MySize.scaleFactorWidth * 328,
                    height: MySize.scaleFactorHeight * 60,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFF0E0E12)
                      // ? Colors.orange
                          : Color(0XFFFFFFFF),
                    ),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(vertical: 8),
                      indicator: BoxDecoration( borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ?  Color(0XFFCFCFFC).withOpacity(.15)
                                :  Color(0XFFCFCFFC).withOpacity(.15)
                        ),

                        color:  Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Color(0XFFF1F1FF),

                      ),
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      unselectedLabelColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFA2A2B5)
                          : Color(0XFFA2A2B5),
                      labelColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFFFFFFF)
                          : Color(0XFF424252),
                      tabs: [
                        Tab(
                          child: Center(
                            child:   Text('Your subscriptions',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: MySize.size12,
                                fontWeight: FontWeight.w600,

                              ),
                            ),),
                        ),
                        Tab(
                          child: Center(
                            child:  Text('Upcoming bills',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: MySize.size12,
                                fontWeight: FontWeight.w600,

                              ),
                            ),),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 250,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SubscriptionWidget(
                          subscriptions: data['subscriptions'],
                        ),
                        UpComingBillWidget(upComingBills: data['upcommingbills'])
                      ],
                    ),
                  ),
                ],
              ),
            );
          },),
      ),
    );
  }
}






