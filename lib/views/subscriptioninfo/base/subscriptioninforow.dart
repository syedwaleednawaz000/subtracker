import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class SubscriptionInfoRow extends StatelessWidget {
  final String text;
  final String? text2;
  final Widget icon; // Accept a Widget for the icon

  const SubscriptionInfoRow({super.key, required this.text, this.text2, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text( text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MySize.size14,
            fontWeight: FontWeight.w600,
            color: Provider.of<ThemeChanger>(context).themeData ==
                darkMode
                ? Colors.white
                : Color(0XFF424252),
          ),
        ),
        // SizedBox(width: MySize.scaleFactorWidth*47,),
        const Spacer(),
         if(text2 !=  null)
           Text(text2!, textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: MySize.size12,
    fontWeight: FontWeight.w500,
    color: Provider.of<ThemeChanger>(context).themeData ==
    darkMode
    ? Color(0XFFA2A2B5)
        : Color(0XFFA2A2B5),
    ),
    ),


        SizedBox(width: MySize.size8,),
        icon, // Directly use the passed widget
      ],
    );
  }
}
