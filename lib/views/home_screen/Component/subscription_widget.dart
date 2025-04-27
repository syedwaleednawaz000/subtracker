import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';

class SubscriptionWidget extends StatelessWidget {
  Map<String, dynamic> subscriptions;
   SubscriptionWidget({required this.subscriptions,super.key});
  @override
  Widget build(BuildContext context) {
    var finalData = subscriptions;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo(
          subscriptionInfoData: finalData,
        )));
      },
      child: Container(
        height: 64,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: MySize.size5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? const Color(0XFF353542)
                  : const Color(0XFF353542).withOpacity(.1),
              width: 1
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: MySize.size22),
              child: TextWidgetInterMedium(
                title: '${finalData['provider'] == null ? "":finalData['provider']['name']}',
                fontSize: MySize.size14,
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFFFFFFFF)
                    : const Color(0XFF424252),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MySize.size22),
              child: Consumer<CurrencyProvider>(builder: (context, currencyProvider, child) {
                return TextWidgetInterMedium(
                  title: AppConstant.validatePrice(currencyCode: currencyProvider.selectedCurrencySymbol,context: context,price: double.parse(finalData['price'].toString(),)),
                  fontSize: MySize.size14,
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? const Color(0XFFFFFFFF)
                      : const Color(0XFF424252),
                  // color: AppColors.white100
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
