import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import '../../notification_screen/notification_screen.dart';
import '../../theme/theme.dart';

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
              backgroundColor:
                  Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0XFF353542)
                      : const Color(0XFFFFFFFF),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Calendar',
                style: TextStyle(
                    color: const Color(0XFFA2A2B5),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen()));
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        height: 25,
                        width: 25,
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
        backgroundColor:
            Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF1C1C23)
                : const Color(0XFFF7F7FF),
        // backgroundColor: Color(0XFF4E4E61),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MySize.scaleFactorHeight * 389,
                // width: MySize.scaleFactorWidth * 375,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MySize.size24),
                        bottomRight: Radius.circular(MySize.size24)),
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? const Color(0XFF353542)
                            : const Color(0XFFFFFFFF)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subs\nSchedule',
                        style: TextStyle(
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF424252),
                            fontSize: MySize.size40,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter'),
                      ),
                       SizedBox(
                        height: MySize.size22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '3 subscriptions for today',
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0xFFA2A2B5)
                                  : const Color(0xFFA2A2B5),
                              fontFamily: 'Inter',
                            ),
                          ),
                          const Spacer(),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MySize.size16),

                              gradient:  const LinearGradient(
                                colors: [
                                  Color(0xFFF1F1FF),
                                  Color(0xFFF1F1FF),
                                  // Color(0xFFFFFFFF).withOpacity(0.15),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: DropdownButton2<int>(
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: MySize.size200,
                              ),
                              style: TextStyle(
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: Provider.of<ThemeChanger>(
                                    context)
                                    .themeData ==
                                    darkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),

                              value: _selectedMonth,

                              underline: const SizedBox.shrink(),
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedMonth = newValue;
                                  });
                                }
                              },
                              items: List.generate(12, (index) => index + 1)
                                  .map((month) {
                                return DropdownMenuItem<int>(
                                  value: month,
                                  child: Text(DateFormat('MMM')
                                      .format(DateTime(0, month))),
                                );
                              }).toList(),

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CalendarContainer(
                        selectedMonth: _selectedMonth,
                        onDateSelected: (DateTime date) {
                          setState(() {
                          });
                          print('Selected Date: ${date.toLocal()}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'January',
                              style: TextStyle(
                                fontSize: MySize.size20,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF1C1C23),
                                // fontFamily: 'Poppins_Regular'
                              ),
                            ),
                            Text(
                              '01.08.2022',
                              style: TextStyle(
                                  fontSize: MySize.size12,
                                  fontWeight: FontWeight.w500,

                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFFA2A2B5),
                                  fontFamily: 'Inter'),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$24.98',
                              style: TextStyle(
                                fontSize: MySize.size20,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF1C1C23),
                                fontFamily: 'Inter'
                              ),
                            ),
                            Text(
                              'in upcoming bills',
                              style: TextStyle(
                                  fontSize: MySize.size12,
                                  fontWeight: FontWeight.w500,
                                  color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                          darkMode
                                      ? const Color(0xFFA2A2B5)
                                      : const Color(0xFFA2A2B5),
                                  fontFamily: 'Inter'),
                            ),
                          ],
                        ),
                      ],
                    ),
                     SizedBox(
                      height: MySize.size24,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        // mainAxisSpacing: 10
                      ),
                      itemCount: 3,
                      // Update the item count based on your actual data
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        List<Map<String, String>> subscriptions = [
                          {
                            'title': 'SignNTrack',
                            'subtitle': '\$5.99',
                            'imageIcon': AppImages.subtrackrIcon,
                          },
                          {
                            'title': 'Profilio',
                            'subtitle': '\$18.99',
                            'imageIcon': AppImages.profilioIcon,
                          },
                          {
                            'title': 'Microsoft',
                            'subtitle': '\$5.99',
                            'imageIcon': AppImages.tresorlyIcon,
                          },
                        ];

                        final subscription = subscriptions[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfo(subscriptionInfoData: {}),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: MySize.size10),
                            child: SubsContainer(
                              title: subscription['title']!,
                              subtitle: subscription['subtitle']!,
                              imageIcon: Image.asset(subscription['imageIcon']!,
                                  height: MySize.size40, width: MySize.size40),
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
        ));
  }
}
