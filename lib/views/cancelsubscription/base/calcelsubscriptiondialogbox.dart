import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                  AppLocalizations.of(context)!.cancel_subscription,
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
                    AppLocalizations.of(context)!.are_you_sure_you_want_to_cancel_your_subscription,
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
                          AppLocalizations.of(context)!.decline,
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
                                AppLocalizations.of(context)!.accept,
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
    });
  }
}
