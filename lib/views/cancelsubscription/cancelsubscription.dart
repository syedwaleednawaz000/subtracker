import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/language_provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../manageplan/base/manageplanrowlist.dart';
import 'base/calcelsubscriptiondialogbox.dart';
import 'base/subscribestackwidget.dart';

class CancelSubscription extends StatelessWidget {
  const CancelSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => Provider.of<PlanProvider>(context,listen: false).userPlan());
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      Colors.black
          : const Color(0XFFFFFFFF),
      appBar:  CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.cancel_subscription),
          body: SingleChildScrollView(
    child:  Consumer<PlanProvider>(builder: (context, planProvider, child) {
      return planProvider.activeSubscriptionData.isEmpty ?
       Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),child: const CircularProgressIndicator(color: AppColors.purpleFF),):
      planProvider.activeSubscriptionData['data'] == null ?
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
        child: Text( AppLocalizations.of(context)!.active_addNewSubscription_are_not_available),):
      Column(
        children: [
          SizedBox(
            height: MySize.size54,
          ),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              height:  MySize.scaleFactorHeight *75,
              width: double.infinity,
              margin: EdgeInsets.only(left: MySize.scaleFactorWidth * 43,right: MySize.scaleFactorWidth * 43),
              // margin: EdgeInsets.symmetric(vertical: MySize.size5),
              child: Stack(
                children: [
                  Container(
                    height: MySize.scaleFactorHeight * 68,
                    width: MySize.scaleFactorWidth * 288,
                    decoration: BoxDecoration(
                      color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF4E4E61).withOpacity(.2)
                          :  Color(0XFFF1F1FF),
                      borderRadius: BorderRadius.circular(16),

                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8,),
                          Text(
                            '${planProvider.activeSubscriptionData['data']['type']}',
                            style: const TextStyle(
                              color: Color(0XFF83839C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2,),

                          TextWidgetInterMedium(
                            title: '\$${planProvider.activeSubscriptionData['data']['price']}',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context)
                                .themeData == darkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: MySize.scaleFactorWidth * 120,
                      child: Container(
                        width: MySize.scaleFactorWidth * 46,
                        height: MySize.scaleFactorHeight*2,
                        decoration: BoxDecoration(
                          color: Color(0xff758AFF),
                          borderRadius: BorderRadius.circular(50),
                        ),)),
                  const SubscribeStackWidget(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MySize.size48,
          ),
          Padding(
            padding: EdgeInsets.only(left: MySize.size25,right: MySize.size25),
            child: Align(
              alignment: Alignment.topLeft,
              child:  Text(  AppLocalizations.of(context)!.canceling_now_will_immediately_remove_all_access_to_features,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeChanger>(context)
                      .themeData == darkMode
                      ? Colors.white
                      : const Color(0XFF424252),
                ),
              ),

            ),
          ),
          SizedBox(height: MySize.size15,),
          Container(
            margin: EdgeInsets.only(left: MySize.size25,right: MySize.size25),
            padding: EdgeInsets.symmetric(horizontal: MySize.size20, vertical: MySize.size16),
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
                  text: AppLocalizations.of(context)!.subscription_tracking,
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.notify,  height: 20,    color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                  text:  AppLocalizations.of(context)!.alerts_and_notifications,
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.chart, height: 20,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode ? Colors.white : const Color(0XFFC1C1CD),
                  ),
                  text:  AppLocalizations.of(context)!.financial_overview,
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.analytics,  height: 20,    color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                  text:  AppLocalizations.of(context)!.spending_analytics,
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.contsupport, height: 20,   color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode ? Colors.white : const Color(0XFFC1C1CD),),
                  text:  AppLocalizations.of(context)!.customer_support,
                ),
              ],
            ),
          )
        ],
      );
    },),
          ),
      bottomNavigationBar: Consumer<PlanProvider>(builder: (context, planProvider, child) {
        return CustomSaveButton(titleText:  AppLocalizations.of(context)!.cancel_subscription,onTap: (){
          if(planProvider.activeSubscriptionData['data'] != null){
            showDialog(
              context: context,
              builder: (context) {
                return const CancelSubsDialogBox();
          },
        );
      }else{
        FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.your_active_subscription_is_not_available,isError: true);
      }
        },
        );
      },),
      // bottomNavigationBar:Container(
      //   height: 114,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     borderRadius: const BorderRadius.only(
      //         topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      //     color: Provider.of<ThemeChanger>(context).themeData == darkMode
      //         ? const Color(0XFF353542).withOpacity(0.50)
      //         : const Color(0xFFF1F1FF).withOpacity(0.50),
      //   ),
      //   child: Center(
      //     child: Container(
      //       height: MySize.size48,
      //       margin: EdgeInsets.only(left: MySize.size35,right: MySize.size35,bottom:MySize.size10 ),
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //           borderRadius:  BorderRadius.circular(100),
      //           color: Provider.of<ThemeChanger>(context).themeData == darkMode
      //               ? const Color(0XFF353542).withOpacity(.7)
      //               : const Color(0XFFF1F1FF).withOpacity(.8),
      //       ),
      //       child:  const CancelSubsDialogBox(),
      //     ),
      //   ),
      // ),
        );
  }
}
