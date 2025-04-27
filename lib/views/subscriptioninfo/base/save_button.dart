import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';

class SaveButtonInSubInfo extends StatelessWidget {
  String subscriptionId;
   SaveButtonInSubInfo({required this.subscriptionId,super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<SubscriptionInfoProvider>(
      builder: (context, subscriptionInfoProvider,
          child) {
        return InkWell(
          onTap: () {
            subscriptionInfoProvider.updateSubscription(
                context: context,
                subscriptionID: subscriptionId,
                description: subscriptionInfoProvider.descriptionController.text.trim(),
                startDate: subscriptionInfoProvider.startDateInString,
                renewalDate: subscriptionInfoProvider.renewalDateInString,
                billingCycle: subscriptionInfoProvider.selectedBilling,
                price: subscriptionInfoProvider.priceInString,
                reminderDuration: subscriptionInfoProvider.selectedReminder,
                categoryID: subscriptionInfoProvider.categoryID,
                providerId: subscriptionInfoProvider.subCategoryID,
                image: subscriptionInfoProvider.filePath);
          },
          child: Container(
            height:
            MySize.scaleFactorHeight * 48,
            margin: const EdgeInsets.only(
                bottom: 18,
                right: 20,
                left: 20),
            width:
            MySize.scaleFactorWidth * 288,
            decoration: BoxDecoration(
              color:
              Provider.of<ThemeChanger>(
                  context)
                  .themeData ==
                  darkMode
                  ? Colors.white
                  .withOpacity(.1)
                  : const Color(
                  0XFFF7F7FF),
              borderRadius:
              BorderRadius.circular(
                  MySize.size24),
              border: Border.all(
                color:
                Provider.of<ThemeChanger>(
                    context)
                    .themeData ==
                    darkMode
                    ? Colors.white
                    .withOpacity(.15)
                    : Colors.white
                    .withOpacity(.15),
              ),
            ),
            child: Center(
              child: subscriptionInfoProvider
                  .isUpdateSub
                  ? const CircularProgressIndicator(
                color:
                AppColors.purpleFF,
              )
                  : Text(
                'Save',
                textAlign:
                TextAlign.center,
                style: TextStyle(
                  fontSize:
                  MySize.size14,
                  fontWeight:
                  FontWeight.w600,
                  color: Provider.of<ThemeChanger>(
                      context)
                      .themeData ==
                      darkMode
                      ? const Color(
                      0XFFFFFFFF)
                      : const Color(
                      0XFF424252),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
