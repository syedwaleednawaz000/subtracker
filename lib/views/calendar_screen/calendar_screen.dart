import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/views/base/settingIcon_screen.dart';
import 'package:sub_tracker/views/credit_card/credit_card.dart';

import '../../bottom_nav/bottom_navBar.dart';
import '../../notification_screen/notification_screen.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/calendar_container.dart';
import '../base/subscription_container.dart';
import '../base/text_widgets.dart';
import '../subscriptioninfo/subscription_info.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? Color(0XFF353542)
                  : Color(0XFFFFFFFF),
              elevation: 0,
              centerTitle: true,
              title:  Text('Calendar',style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
                      },
                      child: Image.asset(AppImages.notificationIcon, height: 25, width: 25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Color(0XFFA2A2B5)
                            : Color(0XFF424252),
                      )),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? Color(0XFF1C1C23)
            : Color(0XFFF7F7FF),
        // backgroundColor: Color(0XFF4E4E61),
        body: Column(
          children: [
            Container(
              height: MySize.scaleFactorHeight * 389,
              // width: MySize.scaleFactorWidth * 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(MySize.size24),
                    bottomRight: Radius.circular(MySize.size24)),
                color: Provider.of<ThemeChanger>(context).themeData ==
                    darkMode
                    ? Color(0XFF353542)
                    : Color(0XFFFFFFFF)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subs\nSchedule',
                      style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                              ? Color(0XFFFFFFFF)
                              : Color(0XFF424252),
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins_Regular'
                      ),),

                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text('3 subscriptions for today',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? Color(0xFFA2A2B5)
                                  : Color(0xFFA2A2B5),
                              fontFamily: 'Poppins_Regular'
                          ),),
                        Spacer(),
                        DropdownMenu(
                            inputDecorationTheme: InputDecorationTheme(
                              constraints: BoxConstraints(minHeight: 20, maxHeight: 34, maxWidth: 95, minWidth: 89),
                              contentPadding: EdgeInsets.only(left: 15, top: 10),
                               fillColor:  Provider.of<ThemeChanger>(context).themeData == darkMode
                               ? Color(0XFFFFFFFF).withOpacity(.1)
                               : Color(0XFFF1F1FF),
                              filled: true,
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none
                                  // (
                                  //  color: Provider.of<ThemeChanger>(context).themeData ==
                                  //                       darkMode
                                  //                       ? Color(0XFFCFCFFC).withOpacity(.15)
                                  //                       : Color(0xFFFFFFFF).withOpacity(.15),
                                // ),
                                // borderSide: Border(
                                //           top: BorderSide(
                                //               color: Provider.of<ThemeChanger>(context).themeData ==
                                //                         darkMode
                                //                         ? Color(0XFFCFCFFC).withOpacity(.15)
                                //                         : Color(0xFFFFFFFF).withOpacity(.15),
                                //           ),
                                //           left: BorderSide(
                                //             color: Provider.of<ThemeChanger>(context).themeData ==
                                //                 darkMode
                                //                 ? Color(0XFFCFCFFC).withOpacity(.15)
                                //                 : Color(0xFFFFFFFF).withOpacity(.15),
                                //           ),
                                //
                                //         ),
                              ),

                              // outlineBorder: BorderSide(color: Colors.blue)
                            ),
                            width: 100,
                            enableSearch: true,
                            hintText: 'Jan',
                            textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0XFFFFFFFF)
                                : Color(0xFF424252),
                            fontFamily: 'Poppins_Regular'

                            ),
                            trailingIcon: const Icon(Icons.expand_more),
                            dropdownMenuEntries: const[
                          DropdownMenuEntry(value: 1, label: 'January'),
                          DropdownMenuEntry(value: 2, label: 'February'),
                          DropdownMenuEntry(value: 3, label: 'March'),
                          DropdownMenuEntry(value: 4, label: 'April'),
                          DropdownMenuEntry(value: 4, label: 'May'),
                          DropdownMenuEntry(value: 4, label: 'June'),
                          DropdownMenuEntry(value: 4, label: 'July'),
                          DropdownMenuEntry(value: 4, label: 'August'),
                          DropdownMenuEntry(value: 4, label: 'September'),
                          DropdownMenuEntry(value: 4, label: 'Octube'),
                          DropdownMenuEntry(value: 4, label: 'November'),
                          DropdownMenuEntry(value: 4, label: 'December'),
                        ])

                      ],
                    ),
                    SizedBox(height: 20,),
                    const CalendarContainer(
                       // containerColor: Color(0XFF4E4E61),
                      containerColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                  Text('January',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? Color(0xFFFFFFFF)
                          : Color(0xFF1C1C23),
                      // fontFamily: 'Poppins_Regular'
                  ),),
                            Text('01.08.2022',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? Color(0xFFA2A2B5)
                                      : Color(0xFFA2A2B5),
                                  fontFamily: 'Poppins_Regular'
                              ),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('\$24.98',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFF1C1C23),
                                  // fontFamily: 'Poppins_Regular'
                              ),),
                            Text('in upcoming bills',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? Color(0xFFA2A2B5)
                                      : Color(0xFFA2A2B5),
                                  fontFamily: 'Poppins_Regular'
                              ),),

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: SubsContainer(
                              title: 'SignNTrack',
                              subtitle: '\$5.99',
                              imageIcon: Image.asset(AppImages.subtrackrIcon, height: 40, width: 40,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: SubsContainer(
                              title: 'Profilio',
                              subtitle: '\$18.99',
                              imageIcon: Image.asset(AppImages.profilioIcon, height: 40, width: 40,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo()));
                            },
                            child: SubsContainer(
                              title: 'Microsoft ',
                              subtitle: '\$5.99',
                              imageIcon: Image.asset(AppImages.tresorlyIcon, height: 40, width: 40,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}




