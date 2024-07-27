import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';

class UpComingBillWidget extends StatelessWidget {
  List<dynamic> upComingBills;
   UpComingBillWidget({required this.upComingBills,super.key});

  @override
  Widget build(BuildContext context) {
    return                         Center(child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: upComingBills.length,
      itemBuilder: (context, index) {
        var finalData = upComingBills[index];
        return  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionInfo(subscriptionInfoData: finalData,)));
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
                )
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MySize.size12, right: MySize.size15),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFF353542)
                          : Color(0XFFF1F1FF),
                    ),
                    child: Column(
                      children: [
                        Text('Jun',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: MySize.size12,
                            fontWeight: FontWeight.w500,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0XFFA2A2B5  )
                                : Color(0XFF424252),

                          ),
                        ),
                        Text('25',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0XFFA2A2B5  )
                                : Color(0XFF424252),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Text("${finalData['provider'] == null ? "":finalData['provider']['name']}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? Color(0XFFFFFFFF)
                        : Color(0XFF424252),

                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(
                        left: MySize.scaleFactorWidth * 115,
                        right: MySize.size22),
                    child:  Text('\$ ${finalData['price']}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Color(0XFFFFFFFF)
                            : Color(0XFF424252),
                      ),
                    )
                )
              ],
            ),
          ),
        );
      },));
  }
}
