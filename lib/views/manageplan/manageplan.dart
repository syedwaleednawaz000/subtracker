import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../settings/settings.dart';
import 'base/manageplanrowlist.dart';
import 'base/monthlypercentwidget.dart';
import 'base/stackpercentagewidget.dart';

class ManagePlan extends StatelessWidget {
  const ManagePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MySize.size72),
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: MySize.size25),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppBar(
                    scrolledUnderElevation: 0,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title:  Text('Manage Plan',style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
                    leading:Image.asset('assets/icons/back_arrow.png', scale: 4.9,color: Color(0XFFA2A2B5),),
                  )
              ),
            ),
          ),
      // backgroundColor: AppColors.black00,
          backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
              ? Color(0XFF1C1C23)
              : Colors.white,
      body: Column(
        children: [

          Stack(
            children: [
              Column(
                children: [

                  SizedBox(
                    height: MySize.size56,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: MySize.scaleFactorHeight * 68,
                      width: MySize.scaleFactorWidth * 288,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Color(0XFFF1F1FF).withOpacity(.8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.purpleFF,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yearly',
                            style: TextStyle(
                              color: Color(0XFF83839C),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          TextWidgetInterMedium(
                            title: '\$39.95',
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                            // color: AppColors.whiteFF
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MySize.size24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: MySize.scaleFactorHeight * 68,
                          width: MySize.scaleFactorWidth * 288,
                          decoration: BoxDecoration(
                            // color: AppColors.black61.withOpacity(0.2),
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                    darkMode
                                ? Color(0XFF4E4E61).withOpacity(.2)
                                : Color(0XFFF1F1FF).withOpacity(.8),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.whiteFF.withOpacity(.10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Monthly',
                                style: TextStyle(
                                  color: Color(0XFF83839C),
                                  fontSize: MySize.size12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextWidgetInterMedium(
                                title: '\$3.34',
                                fontSize: MySize.size14,
                                fontWeight: FontWeight.w600,
                                // color: AppColors.whiteFF
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MySize.size30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MySize.size32),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextWidgetInterBold(
                        title: 'Features',
                        // color: AppColors.whiteFF,
                        align: TextAlign.start,
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MySize.size8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MySize.size20, vertical: MySize.size16),
                    height: MySize.scaleFactorHeight * 245,
                    width: MySize.scaleFactorWidth * 328,
                    decoration: BoxDecoration(
                      // color: AppColors.grey61.withOpacity(.20), F1F1FF
                      color: Provider.of<ThemeChanger>(context).themeData ==
                              darkMode
                          ? Color(0XFF4E4E61).withOpacity(.2)
                          : Color(0XFFF1F1FF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: MySize.size2,
                        color: AppColors.whiteFc.withOpacity(0.10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        manageplanrowlist(
                          imageIcon: Image.asset(AppImages.plan),
                          text: 'Subscription Tracking',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        manageplanrowlist(
                          imageIcon: Image.asset(AppImages.notify),
                          text: 'Alerts and Notifications',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        manageplanrowlist(
                          imageIcon: Image.asset(AppImages.chart),
                          text: 'Financial Overview',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        manageplanrowlist(
                          imageIcon: Image.asset(AppImages.analytics),
                          text: 'Spending Analytics',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        manageplanrowlist(
                          imageIcon: Image.asset(AppImages.contsupport),
                          text: 'Customer Support',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const MonthlyPercentWidget(),
              MonthlyPercentWidget2(),

              /// monthly
              const StackPercentageWidget(),

              /// -20%
              Positioned(
                top: MySize.scaleFactorHeight * 148,
                left: MySize.scaleFactorHeight * 188,
                child: Container(
                  height: 1,
                  width: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFF7DFFEE),
                  ),
                ),
              ),

            ],
          ),

          const Spacer(),
          CustomSaveButton(
            titleText: 'Next',
          ),

        ],
      ),
    ));
  }
}
