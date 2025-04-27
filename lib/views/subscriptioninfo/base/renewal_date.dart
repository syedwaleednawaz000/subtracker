import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/Provider/sub_scription_info_provider.dart';
import 'package:sub_tracker/views/subscriptioninfo/base/subscriptioninforow.dart';

class RenewalDate extends StatelessWidget {
  const RenewalDate({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Provider.of<SubscriptionInfoProvider>(context,listen: false).renewalDate(context: context);
      },
      child: Consumer<SubscriptionInfoProvider>(builder: (context, subscriptionInfoProvider, child) {
        return SubscriptionInfoRow(
          text: 'Renewal Date',
          text2: subscriptionInfoProvider.renewalDateInString,
          icon: Image.asset(
            AppImages.arrowLeft,
            width: MySize.size14,
            height: MySize.size14,
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0xFFA2A2B5)
                : const Color(0xFFA2A2B5),
          ),
        );
      },),
    );
  }
}
