import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/settings/base/showdialog.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../manageplan/base/manageplanrowlist.dart';
import '../personaldata/personaldata.dart';
import '../settings/settings.dart';
import 'base/calcelsubscriptiondialogbox.dart';
import 'base/subscribestackwidget.dart';

class CancelSubscription extends StatelessWidget {
  const CancelSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Color(0XFF1C1C23)
          : Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size23, vertical: MySize.size32),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Image.asset(AppConstant.backArrow)),
                    SizedBox(
                      width: MySize.scaleFactorWidth * 88,
                    ),
                    Text(
                      'Cancel Subscription',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: MySize.size16,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                            ? Color(0XFFA2A2B5)
                            : Color(0XFFA2A2B5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size54,
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
                    color:
                        Provider.of<ThemeChanger>(context).themeData == darkMode
                            ? Color(0XFF4E4E61).withOpacity(.2)
                            : Color(0XFFF1F1FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(.15)),
                        left: BorderSide(color: Colors.white.withOpacity(.15)),
                        // right: BorderSide(color: Colors.white.withOpacity(.5)),
                        bottom: BorderSide.none
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Yearly',
                        style: TextStyle(
                          color: Color(0XFF83839C),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      TextWidgetInterMedium(
                        title: '\$39.95',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        // color: AppColors.whiteFF
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size48,
              ),
              Padding(
                padding: EdgeInsets.only(left: MySize.size35),
                child: Align(
                  alignment: Alignment.topLeft,
                  child:  Text(  'Canceling now will immediately remove\nall access to features.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Provider.of<ThemeChanger>(context)
                          .themeData == darkMode ? Colors.white : Color(0XFF424252),
                    ),),

                ),
              ),
              SizedBox(
                height: MySize.size15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size20, vertical: MySize.size16),
                height: MySize.scaleFactorHeight * 230,
                width: MySize.scaleFactorWidth * 328,
                decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFF4E4E61).withOpacity(.2)
                          : Color(0XFFF1F1FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(.15)),
                      left: BorderSide(color: Colors.white.withOpacity(.15)),
                      // right: BorderSide(color: Colors.white.withOpacity(.5)),
                      bottom: BorderSide.none
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    manageplanrowlist(
                      imageIcon: Image.asset(AppConstant.plan,    color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : Color(0XFFC1C1CD),),
                      text: 'Subscription Tracking',
                    ),
                    SizedBox(
                      height: MySize.size16,
                    ),
                    manageplanrowlist(
                      imageIcon: Image.asset(AppConstant.notify,    color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : Color(0XFFC1C1CD),),
                      text: 'Alerts and Notifications',
                    ),
                    SizedBox(
                      height: MySize.size16,
                    ),
                    manageplanrowlist(
                      imageIcon: Image.asset(AppConstant.chart,
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : Color(0XFFC1C1CD),
                      ),
                      text: 'Financial Overview',
                    ),
                    SizedBox(
                      height: MySize.size16,
                    ),
                    manageplanrowlist(
                      imageIcon: Image.asset(AppConstant.analytics,    color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : Color(0XFFC1C1CD),),
                      text: 'Spending Analytics',
                    ),
                    SizedBox(
                      height: MySize.size16,
                    ),
                    manageplanrowlist(
                      imageIcon: Image.asset(AppConstant.contsupport,    color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : Color(0XFFC1C1CD),),
                      text: 'Customer Support',
                    ),
                  ],
                ),
              ),

              Spacer(),

              /// cancel subscription in inside CancelSubscriptionDialogBox

      Container(
        height: 114,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? Color(0XFF353542).withOpacity(.7)
                : Color(0XFFF1F1FF).withOpacity(.8),
            // border: Border(
            //     top: BorderSide(color: Colors.white.withOpacity(.15)),
            //     left: BorderSide(color: Colors.white.withOpacity(.15)),
            //     // right: BorderSide(color: Colors.white.withOpacity(.5)),
            //     bottom: BorderSide.none
            // ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: AppColors.black00.withOpacity(.25)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //     height: 48,
            //     width: 288,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(40),
            //       color: Provider.of<ThemeChanger>(context).themeData ==
            //           darkMode
            //           ? Color(0XFFFFFFFF).withOpacity(.1)
            //           : Color(0XFFF1F1FF),
            //       border: Border(
            //           top: BorderSide(color: Colors.white.withOpacity(.15)),
            //           left: BorderSide(color: Colors.white.withOpacity(.15)),
            //           // right: BorderSide(color: Colors.white.withOpacity(.5)),
            //           bottom: BorderSide.none
            //       ),
            //       // border: Border.all(
            //       //     // color: Color(0XFFFFFFFF).withOpacity(.15)
            //       //   color: Provider.of<ThemeChanger>(context).themeData ==
            //       //       darkMode
            //       //       ? Color(0XFFFFFFFF).withOpacity(.15)
            //       //       : ,
            //       // )
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Cancel Subscription',
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           color:
            //           Provider.of<ThemeChanger>(context).themeData ==
            //               darkMode
            //               ? Colors.white
            //               : Color(0XFF1c1c23),
            //         ),
            //       ),
            //     )),
            CancelSubsDialogBox(),
          ],

        ),
      )


            ],
          ),

          // const MonthlyPercentWidget(),

          Container(
              padding: EdgeInsets.only(
                  top: MySize.scaleFactorHeight * 203,
                  left: MySize.scaleFactorHeight * 162),
              child: const SubscribeStackWidget()),

          Positioned(
            top: MySize.scaleFactorHeight * 144,
            left: MySize.scaleFactorWidth * 170,
            child: Container(
              height: 1,
              width: 48,
              decoration: const BoxDecoration(
                color: Color(0xff758AFF),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
