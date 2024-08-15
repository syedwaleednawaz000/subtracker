import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/theme/theme.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/subscriptioninfo/subscription_info.dart';

class UpComingBillWidget extends StatelessWidget {
  Map<String, dynamic> upComingBills;

  UpComingBillWidget({required this.upComingBills, super.key});

  @override
  Widget build(BuildContext context) {
    var finalData = upComingBills;
    DateTime parsedDate = DateTime.parse(finalData['renewal_date']);
    String month = DateFormat('MMM').format(parsedDate);
    String day = DateFormat('d').format(parsedDate);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubscriptionInfo(
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
                    ? Color(0XFF353542)
                    : Color(0XFF353542).withOpacity(.1),
                width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(left: MySize.size12, right: MySize.size15),
                  child: Container(
                    height: MySize.size40,
                    width: MySize.size40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFF353542)
                          : Color(0XFFF1F1FF),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${month}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: MySize.size12,
                            fontWeight: FontWeight.w500,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0XFFA2A2B5)
                                : Color(0XFF424252),
                          ),
                        ),
                        Text(
                          '${day}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.w600,
                            color: Provider.of<ThemeChanger>(context).themeData ==
                                darkMode
                                ? Color(0XFFA2A2B5)
                                : Color(0XFF424252),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "${finalData['provider'] == null ? "" : finalData['provider']['name']}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Color(0XFFFFFFFF)
                        : Color(0XFF424252),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(right: MySize.size22),
                child: Consumer<CurrencyProvider>(builder:  (context, currencyProvider, child) {
                  return Text(
                    '${currencyProvider.selectedCurrencySymbol} ${finalData['price']}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w600,
                      color:
                      Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFFFFFFF)
                          : Color(0XFF424252),
                    ),
                  );
                },))
          ],
        ),
      ),
    );
  }
}
