import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/schedule_provider.dart';
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
  DateTime dateTime = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  String dateTimeInString = '';
  @override
  void initState() {
    dateTimeInString = _dateFormat.format(dateTime).toString();
    Future.microtask(() => Provider.of<ScheduleProvider>(context,listen: false).getScheduleData(date: _dateFormat.format(DateTime.now())));
    // TODO: implement initState
    super.initState();
  }
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
                          Consumer<ScheduleProvider>(builder: (context, scheduleProvider, child) {
                            int length =0;
                            if (scheduleProvider.scheduleData.isNotEmpty) {
                              if(scheduleProvider.scheduleData['data']['providers'].length != 0){
                                length = scheduleProvider.scheduleData['data']['providers'].length;
                              }else{
                                print("provider is empty");
                              }
                            }else{
                              print( "model data ia sempty");
                            }
                            return                           Text(
                              '$length subscriptions for today',
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
                            );
                          },),
                          const Spacer(),
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MySize.size16),
                              color: Provider.of<ThemeChanger>(context).themeData ==
                                  darkMode
                                  ? const Color(0xFF000000)
                                  : const Color(0xFFF1F1FF),


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
                          setState(() {});
                          final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                          dateTimeInString = dateFormat.format(date);
                          setState(() {});
                          Provider.of<ScheduleProvider>(context,listen: false).getScheduleData(date: dateFormat.format(date));
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
                              DateFormat('MMM').format(DateTime(0, _selectedMonth)),
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
                              '${dateTimeInString}',
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
                            Consumer<ScheduleProvider>(builder: (context, scheduleProvider, child) {
                              return                             Text(
                                '\$${scheduleProvider.scheduleData.isNotEmpty ?scheduleProvider.scheduleData['data']['total_bill']:"0"}',
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
                              );
                            },),
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
                    Consumer<ScheduleProvider>(builder: (context, scheduleProvider, child) {
                      return scheduleProvider.isLoading ?   const CircularProgressIndicator(color: Colors.green,)
                          : scheduleProvider.scheduleData['data']['providers'].length ==0 ?
                      const Center(child: Text("Upcoming bills not available",style: TextStyle(color: Colors.black),),):
                      GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          // mainAxisSpacing: 10
                        ),
                        itemCount: scheduleProvider.scheduleData['data']['providers'].length,
                        // Update the item count based on your actual data
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {

                          final subscription = scheduleProvider.scheduleData['data']['providers'][index];

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
                                title: subscription['provider_name']??"",
                                subtitle: subscription['price']??"",
                                imageIcon:           CachedNetworkImage(
                                  imageUrl: subscription['provider_icon']??"",
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: MySize.size40, width: MySize.size40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      );

                    },)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
