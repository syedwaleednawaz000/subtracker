import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
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
            ? Color(0XFF1C1C23)
            : Color(0XFFF7F7FF),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: CustomContainer(

                  ),
                ),

                SizedBox(height: 10,),
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
                      Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: MySize.size16,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: Container(
                              height: 64,
                              width: 328,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Color(0XFF353542)
                                    : Color(0XFF353542).withOpacity(.1),
                                  width: 1
                              ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size12, right: MySize.size15),
                                    child: Image.asset('assets/icons/esss.png',  height: 40, width: 40,),
                                  ),
                                  TextWidgetInterMedium(
                                      title: 'SignNTrack',
                                      fontSize: MySize.size14,
                                      // color: AppColors.white100
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.scaleFactorWidth * 115,
                                        right: MySize.size22),
                                    child: TextWidgetInterMedium(
                                        title: '\$5.99',
                                        fontSize: MySize.size14,
                                        // color: AppColors.white100
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size8,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: Container(
                              height: 64,
                              width: 328,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                        ? Color(0XFF353542)
                                        : Color(0XFF353542).withOpacity(.1),
                                    width: 1
                                )
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size12, right: MySize.size15),
                                    child: Image.asset('assets/icons/pee.png',  height: 40, width: 40,),
                                  ),
                                  TextWidgetInterMedium(
                                    title: 'Profilio',
                                    fontSize: MySize.size14,
                                    // color: AppColors.white100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.scaleFactorWidth * 135,
                                        right: MySize.size22),
                                    child: TextWidgetInterMedium(
                                      title: '\$18.99',
                                      fontSize: MySize.size14,
                                      // color: AppColors.white100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size8,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: Container(
                              height: 64,
                              width: 328,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                        ? Color(0XFF353542)
                                        : Color(0XFF353542).withOpacity(.1),
                                    width: 1
                                )
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size12, right: MySize.size15),
                                    child: Image.asset('assets/icons/tresorly.png', height: 40, width: 40,),
                                  ),
                                  Text('Tresorly',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: MySize.size14,
                                      fontWeight: FontWeight.w600,
                                      color: Provider.of<ThemeChanger>(context).themeData ==
                                          darkMode
                                          ? Color(0XFFFFFFFF)
                                          : Color(0XFF424252),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.scaleFactorWidth * 128,
                                        right: MySize.size22),
                                    child: Text('\$29.99',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: MySize.size14,
                                        fontWeight: FontWeight.w600,
                                        color: Provider.of<ThemeChanger>(context).themeData ==
                                            darkMode
                                            ? Color(0XFFFFFFFF)
                                            : Color(0XFF424252),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size6,
                          ),
      
                        ],
                      )),
                      Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MySize.size16,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                                },
                                child: Container(
                                  height: 64,
                                  width: 328,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              ? Color(0XFF353542)
                                              : Color(0XFF353542).withOpacity(.1),
                                          width: 1
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.size12, right: MySize.size15),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? Color(0XFF353542)
                                                : Color(0XFFF1F1FF),
                                          ),
                                          child: Column(
                                            children: [
                                              Text('Jun',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),

                                                ),
                                              ),
                                              Text('25',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Text('SignNTrack',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeChanger>(context).themeData ==
                                              darkMode
                                              ? Color(0XFFFFFFFF)
                                              : Color(0XFF424252),

                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.scaleFactorWidth * 115,
                                            right: MySize.size22),
                                        child:  Text(  '\$5.99',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(context).themeData ==
                                                darkMode
                                                ? Color(0XFFFFFFFF)
                                                : Color(0XFF424252),

                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                                },
                                child: Container(
                                  height: 64,
                                  width: 328,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border:   Border.all(
                                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                      ? Color(0XFF353542)
                                      : Color(0XFF353542).withOpacity(.1),
                                    width: 1
                                )
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.size12, right: MySize.size15),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? Color(0XFF353542)
                                                : Color(0XFFF1F1FF),
                                          ),
                                          child:  Column(
                                            children: [
                                              Text('Jun',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),

                                                ),
                                              ),
                                              Text('25',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Text('Profilio',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeChanger>(context).themeData ==
                                              darkMode
                                              ? Color(0XFFFFFFFF)
                                              : Color(0XFF424252),

                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.scaleFactorWidth * 135,
                                            right: MySize.size22),
                                        child:  Text(  '\$18.99',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(context).themeData ==
                                                darkMode
                                                ? Color(0XFFFFFFFF)
                                                : Color(0XFF424252),

                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                                },
                                child: Container(
                                  height: 64,
                                  width: 328,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              ? Color(0XFF353542)
                                              : Color(0XFF353542).withOpacity(.1),
                                          width: 1
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.size12, right: MySize.size15),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                ? Color(0XFF353542)
                                                : Color(0XFFF1F1FF),
                                          ),
                                          child:  Column(
                                            children: [
                                              Text('Jun',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),

                                                ),
                                              ),
                                              Text('25',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: MySize.size14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                                      darkMode
                                                      ? Color(0XFFA2A2B5  )
                                                      : Color(0XFF424252),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Text('Tresorly',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size14,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeChanger>(context).themeData ==
                                              darkMode
                                              ? Color(0XFFFFFFFF)
                                              : Color(0XFF424252),

                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.scaleFactorWidth * 128,
                                            right: MySize.size22),
                                        child:  Text(  '\$29.99',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(context).themeData ==
                                                darkMode
                                                ? Color(0XFFFFFFFF)
                                                : Color(0XFF424252),

                                          ),
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MySize.size6,
                              ),
                            ],
                          )),
      
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}






