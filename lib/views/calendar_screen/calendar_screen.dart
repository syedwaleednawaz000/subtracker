import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/schedule_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
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
    Future.microtask(() => Provider.of<ScheduleProvider>(context, listen: false)
        .getScheduleData(date: _dateFormat.format(DateTime.now())));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        appBar:  CustomAppBarInAll(leading: true,actions: true,title:AppLocalizations.of(context)!.calendar),
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
        Colors.black
            : const Color(0XFFFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MySize.scaleFactorHeight * 389,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MySize.size24),
                        bottomRight: Radius.circular(MySize.size24)),
                    color:  Provider.of<ThemeChanger>(context).themeData == darkMode ?
                Colors.black
                    : const Color(0XFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MySize.size42,
                      ),
                      Text(
                        AppLocalizations.of(context)!.subs_schedule,
                        style: TextStyle(
                            color:
                                Provider.of<ThemeChanger>(context).themeData ==
                                        darkMode
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF424252),
                            fontSize: MySize.size40,
                            height: 1.1,
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
                          Consumer<ScheduleProvider>(
                            builder: (context, scheduleProvider, child) {
                              int length = 0;
                              if (scheduleProvider.scheduleData.isNotEmpty) {
                                if (scheduleProvider.scheduleData['data']['subscriptions'].length != 0) {
                                  length = scheduleProvider.scheduleData['data']['subscriptions'].length;
                                } else {
                                  print("provider is empty");
                                }
                              } else {
                                print("model data is empty");
                              }
                              return Text(
                                '$length ${AppLocalizations.of(context)!.subscriptions_for_today}',
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
                            },
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MySize.size24),
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0xFFFFFFFF).withOpacity(.10)
                                  : const Color(0xFFF1F1FF),
                            ),
                            child: DropdownButton2<int>(
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                padding: EdgeInsets.all(10),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                color: Provider.of<ThemeChanger>(context)
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
                                  child: Text(DateFormat('MMMM')
                                      .format(DateTime(0, month))),
                                );
                              }).toList(),

                              // Custom button with an icon
                              customButton: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _selectedMonth != null
                                          ? DateFormat('MMMM').format(
                                              DateTime(0, _selectedMonth!))
                                          : AppLocalizations.of(context)!.select_month,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Icon(
                                      Icons.expand_more, // Custom icon
                                      color: Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                              darkMode
                                          ? Colors.white
                                          : Colors.black,
                                      size: 24, // Custom size
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MySize.size30),
                      CalendarContainer(
                        selectedMonth: _selectedMonth,
                        onDateSelected: (DateTime date) {
                          setState(() {});
                          final DateFormat dateFormat =
                              DateFormat('yyyy-MM-dd');
                          dateTimeInString = dateFormat.format(date);
                          setState(() {});
                          Provider.of<ScheduleProvider>(context, listen: false)
                              .getScheduleData(date: dateFormat.format(date));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MySize.size24,
                    right: MySize.size24,
                    top: MySize.size24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('MMMM')
                                  .format(DateTime(0, _selectedMonth)),
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
                            Consumer<ScheduleProvider>(
                              builder: (context, scheduleProvider, child) {
                                String finalData = "0";
                                if(scheduleProvider.scheduleData != null){
                                  if(scheduleProvider.scheduleData['data'] != null){
                                    finalData = scheduleProvider.scheduleData['data']['total_bill'].toString() ??"";
                                  }
                                }
                                return Consumer<CurrencyProvider>(
                                  builder: (context, currencyProvider, child) {
                                    return Text(
                                      AppConstant.validatePrice(price: double.parse(finalData),context: context,),
                                      style: TextStyle(
                                          fontSize: MySize.size20,
                                          fontWeight: FontWeight.w700,
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                  ? const Color(0xFFFFFFFF)
                                                  : const Color(0xFF1C1C23),
                                          fontFamily: 'Inter'),
                                    );
                                  },
                                );
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!.upcoming_bills,
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
                    Consumer<ScheduleProvider>(
                      builder: (context, scheduleProvider, child) {
                        return scheduleProvider.isLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.purpleFF,
                              )
                            : scheduleProvider.scheduleData.isEmpty
                                ? Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.please_try_again,
                                      style: TextStyle(
                                          color:
                                              Provider.of<ThemeChanger>(context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                    ),
                                  )
                                : scheduleProvider.scheduleData['data']['subscriptions'].length == 0
                                    ? Center(
                                        child: Text(
                                          AppLocalizations.of(context)!.your_upcoming_bills_are_not_available,
                                          style: TextStyle(
                                              color: Provider.of<ThemeChanger>(
                                                              context)
                                                          .themeData ==
                                                      darkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      )
                                    : GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          // mainAxisSpacing: 10
                                        ),
                                        itemCount: scheduleProvider.scheduleData['data']['subscriptions'].length,
                                        // Update the item count based on your actual data
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final subscription = scheduleProvider.scheduleData['data']['subscriptions'][index];
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(()=>SubscriptionInfo(subscriptionInfoData: subscription),);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MySize.size10),
                                              child: SubsContainer(
                                                title: subscription['provider']['name'] ?? "",
                                                subtitle:
                                                    subscription['price'] ?? "",
                                                imageIcon: buildImageWidget(imageUrl: subscription['provider']['image_icon'] ?? ""),
                                              ),
                                            ),
                                          );
                                        },
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


  Widget buildImageWidget({required String imageUrl}) {
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      // Show SVG image
      return SvgPicture.network(
        imageUrl,
            height: MySize.size40,
            width: MySize.size40,
        placeholderBuilder: (context) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: MySize.size40,
            width: MySize.size40,
            color: Colors.grey[300],
          ),
        ),
        // errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 40, color: Colors.red),
      );
    } else {
      // Show CachedNetworkImage for non-SVG images
      return CachedNetworkImage(
        imageUrl: imageUrl,
        height: MySize.size40,
        width: MySize.size40,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: MySize.size40,
            width: MySize.size40,
            color: Colors.grey[300],
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error, size: 40, color: Colors.red),
      );
    }
  }
}
