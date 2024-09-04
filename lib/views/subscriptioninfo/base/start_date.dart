import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/subscriptioninforow.dart';
import 'package:intl/intl.dart';
class StartDate extends StatelessWidget {
  const StartDate({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Provider.of<SubscriptionInfoProvider>(context,listen: false).startDate(context: context);
      },
      child: Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
        return SubscriptionInfoRow(
          text: 'Start Date',
          text2: subscriptionInfoProvider.startDateInString,
          icon: Image.asset(
            AppImages.arrowLeft,
            width: MySize.size12,
            height: MySize.size12,
            color: Provider.of<ThemeChanger>(
                context)
                .themeData ==
                darkMode
                ? const Color(0xFFA2A2B5)
                : const Color(0xFFA2A2B5),
          ),
        );
      },),
    );
  }
}
