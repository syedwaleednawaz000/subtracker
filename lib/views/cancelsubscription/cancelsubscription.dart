import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/subscription_provider.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/settings/base/showdialog.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
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
    Future.microtask(() => Provider.of<SubscriptionProvider>(context,listen: false).activeSubscriptions());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                      child: Image.asset(AppImages.backArrow)),
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
                          ? const Color(0XFFA2A2B5)
                          : const Color(0XFFA2A2B5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MySize.size54,
            ),
          Consumer<SubscriptionProvider>(builder: (context, subscriptionProvider, child) {
            return subscriptionProvider.activeSubscriptionData.isEmpty ?
            const Center(child: CircularProgressIndicator(color: Colors.green),):
            subscriptionProvider.activeSubscriptionData['data'].length == 0 ?
            const Center(child: Text("Active subscription are not available "),):
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subscriptionProvider.activeSubscriptionData['data'].length,
              itemBuilder: (context, index) {
                var finalData = subscriptionProvider.activeSubscriptionData['data'][index];
                return  InkWell(
                  onTap: () {
                    subscriptionProvider.changeCancelIndex(index: index,subscriptionID: finalData['id'].toString());
                  },
                  child: Container(
                    height: MySize.scaleFactorHeight * 68,
                    width: MySize.scaleFactorWidth * 288,
                    decoration: BoxDecoration(
                      color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF4E4E61).withOpacity(.2)
                          : const Color(0XFFF1F1FF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border(
                          top: BorderSide(color: Colors.white.withOpacity(.15)),
                          left: BorderSide(color: Colors.white.withOpacity(.15)),
                          // right: BorderSide(color: Colors.white.withOpacity(.5)),
                          bottom: BorderSide.none
                      ),
                    ),
                    child: Stack(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
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
                        const SubscribeStackWidget(),
                      ],
                    ),
                  ),
                );
              },);
          },),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeChanger>(context)
                        .themeData == darkMode ? Colors.white : const Color(0XFF424252),
                  ),),

              ),
            ),
            SizedBox(height: MySize.size15,),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.size20, vertical: MySize.size16),
              height: MySize.scaleFactorHeight * 230,
              width: MySize.scaleFactorWidth * 328,
              decoration: BoxDecoration(
                color:
                Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFF4E4E61).withOpacity(.2)
                    : const Color(0XFFF1F1FF),
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
                    imageIcon: Image.asset(AppImages.plan,  height: 20,    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                    text: 'Subscription Tracking',
                  ),
                  SizedBox(
                    height: MySize.size16,
                  ),
                  manageplanrowlist(
                    imageIcon: Image.asset(AppImages.notify,  height: 20,    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                    text: 'Alerts and Notifications',
                  ),
                  SizedBox(
                    height: MySize.size16,
                  ),
                  manageplanrowlist(
                    imageIcon: Image.asset(AppImages.chart, height: 20,
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode ? Colors.white : const Color(0XFFC1C1CD),
                    ),
                    text: 'Financial Overview',
                  ),
                  SizedBox(
                    height: MySize.size16,
                  ),
                  manageplanrowlist(
                    imageIcon: Image.asset(AppImages.analytics,  height: 20,    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                    text: 'Spending Analytics',
                  ),
                  SizedBox(
                    height: MySize.size16,
                  ),
                  manageplanrowlist(
                    imageIcon: Image.asset(AppImages.contsupport, height: 20,   color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                    text: 'Customer Support',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
          bottomNavigationBar:Container(
            height: MySize.size48,
            margin: EdgeInsets.only(left: MySize.size35,right: MySize.size35,bottom:MySize.size35 ),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(100),
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFF353542).withOpacity(.7)
                    : const Color(0XFFF1F1FF).withOpacity(.8),
            ),
            child:  CancelSubsDialogBox(planID: "2"),
          ),
    ));
  }
}
