import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';

class SubscriptionWidget extends StatelessWidget {
  List<dynamic> subscriptions;
   SubscriptionWidget({required this.subscriptions,super.key});

  @override
  Widget build(BuildContext context) {
    return                         Center(child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subscriptions.length,
      itemBuilder: (context, index) {
        var finalData = subscriptions[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo(
              subscriptionInfoData: finalData,
            )));
          },
          child: Container(
            height: 64,
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: Provider.of<ThemeChanger>(context).themeData == darkMode
                      ? Color(0XFF353542)
                      : Color(0XFF353542).withOpacity(.1),
                  width: 1
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MySize.size12, right: MySize.size15),
                  child: Image.asset(AppImages.subtrackrIcon,  height: 40, width: 40,),
                ),
                TextWidgetInterMedium(
                  title: '${finalData['provider'] == null ? "":finalData['provider']['name']}',
                  fontSize: MySize.size14,
                  // color: AppColors.white100
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MySize.scaleFactorWidth * 115,
                      right: MySize.size22),
                  child: TextWidgetInterMedium(
                    title: '\$ ${finalData['price']}',
                    fontSize: MySize.size14,
                    // color: AppColors.white100
                  ),
                )
              ],
            ),
          ),
        );
      },));
  }
}
