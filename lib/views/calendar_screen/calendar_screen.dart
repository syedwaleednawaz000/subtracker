
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import '../../notification_screen/notification_screen.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/calendar_container.dart';
import '../base/subscription_container.dart';
import '../subscriptioninfo/subscription_info.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedMonth = DateTime.now().month;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? const Color(0XFF353542)
                  : const Color(0XFFFFFFFF),
              elevation: 0,
              centerTitle: true,
              title:  Text('Calendar',style: TextStyle(color: const Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                      },
                      child: Image.asset(AppImages.notificationIcon, height: 25, width: 25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? const Color(0XFFA2A2B5)
                            : const Color(0XFF424252),
                      )),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF1C1C23)
            : const Color(0XFFF7F7FF),
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
                    ? const Color(0XFF353542)
                    : const Color(0XFFFFFFFF)
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
                              ? const Color(0XFFFFFFFF)
                              : const Color(0XFF424252),
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins_Regular'
                      ),),

                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(
                          '3 subscriptions for today',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? const Color(0xFFA2A2B5)
                                : const Color(0xFFA2A2B5),
                            fontFamily: 'Poppins_Regular',
                          ),
                        ),
                        const Spacer(),
                        DropdownButton2<int>(dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,

                        ),
                          value: _selectedMonth,
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedMonth = newValue;
                              });
                            }
                          },
                          items: List.generate(12, (index) => index + 1).map((month) {
                            return DropdownMenuItem<int>(
                              value: month,
                              child: Text(DateFormat('MMM').format(DateTime(0, month))),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CalendarContainer(
                      selectedMonth: _selectedMonth,
                      onDateSelected: (DateTime date) {
                        setState(() {
                          _selectedDate = date;
                        });
                        print('Selected Date: ${date.toLocal()}');
                      },
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
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF1C1C23),
                      // fontFamily: 'Poppins_Regular'
                  ),),
                            Text('01.08.2022',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFFA2A2B5),
                                  fontFamily: 'Poppins_Regular'
                              ),),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('\$24.98',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF1C1C23),
                                  // fontFamily: 'Poppins_Regular'
                              ),),
                            Text('in upcoming bills',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFFA2A2B5),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionInfo(subscriptionInfoData: {},)));
                            },
                            child: SubsContainer(
                              title: 'SignNTrack',
                              subtitle: '\$5.99',
                              imageIcon: Image.asset(AppImages.subtrackrIcon, height: 40, width: 40,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionInfo(subscriptionInfoData: {},)));
                            },
                            child: SubsContainer(
                              title: 'Profilio',
                              subtitle: '\$18.99',
                              imageIcon: Image.asset(AppImages.profilioIcon, height: 40, width: 40,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionInfo(subscriptionInfoData: {},)));
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




