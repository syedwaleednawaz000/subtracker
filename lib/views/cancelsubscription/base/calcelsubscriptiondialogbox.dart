import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class CancelSubsDialogBox extends StatelessWidget {

  const CancelSubsDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanProvider>(builder: (context, planProvider, child) {
      return GestureDetector(
        onTap: () {
          if(planProvider.activeSubscriptionData['data'] != null){
            showDialog(
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: AlertDialog(
                      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF1C1C23)
                          : const Color(0XFFF1F1FF),
                      titlePadding: const EdgeInsets.only(top: 25),
                      title: Column(
                        children: [
                          Text(
                            'Cancel Subscription',
                            style: TextStyle(
                              fontSize: 18,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : const Color(0XFF1c1c23),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MySize.size8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Are you sure you want to cancel your subscription',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : const Color(0XFF424252),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MySize.size20,
                          ),
                          const Divider(
                            thickness: .2,
                            color: Color(0xff333339),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Decline',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Provider.of<ThemeChanger>(context)
                                          .themeData == darkMode
                                          ? Colors.red
                                          : Colors.red,
                                    ),
                                  )),
                              SizedBox(
                                width: MySize.size10,
                              ),
                              Consumer<PlanProvider>(
                                builder: (context, planProvider, child) {
                                  return TextButton(
                                    onPressed: () {
                                      planProvider.cancelPlan(
                                          context: context, planID: planProvider.activeSubscriptionData['data']['id'].toString());
                                    },
                                    child: planProvider.isCancel
                                        ? SizedBox(
                                        height: MySize.size20,
                                        width: MySize.size20,
                                        child: const CircularProgressIndicator(
                                          color: Colors.blue,
                                        ))
                                        : Padding(
                                        padding:
                                        const EdgeInsets.only(left: 40),
                                        child: Text(
                                          'Accept',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Provider.of<ThemeChanger>(
                                                context)
                                                .themeData ==
                                                darkMode
                                                ? const Color(0XFF2B83F2)
                                                : const Color(0XFF2B83F2),
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      )),
                );
              },
            );
          }else{
            FlutterToast.toastMessage(message: "Your active subscription is not available",isError: true);
          }
        },
        child: Center(
          child: Container(
            height: 48,
            width: 288,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySize.size40),
              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? const Color(0XFFF1F1FF).withOpacity(.20)
                  : const Color(0XFFF1F1FF),
            ),
            child: Center(
              child: TextWidgetInterMedium(
                title: 'Cancel Subscription',
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? Colors.white
                    : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    });
  }
}
