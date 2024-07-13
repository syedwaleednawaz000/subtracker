import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class CalendarContainer extends StatelessWidget {
  const CalendarContainer({
    super.key,
    // required this.titleText,
    // required this.subtitleText,
    required this.containerColor,
    // this.bgColor,
  });

  // final String titleText;
  // final String subtitleText;
  final Color containerColor;
  // final Color? bgColor;

  @override
  Widget build(BuildContext context) {

    List<String> titleText = [
      '01', '02', '03', '04', '05', '06', '07',
      '08', '09', '10', '11', '12', '13', '14',
      '15', '16', '17', '18', '19', '20', '21',
      '22', '23', '24', '25', '26', '27', '28',
      '29', '30', '31',
    ];
    List<String> subtitleText = [
      'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su',
      'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su',
      'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su',
      'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su',
      'Mo', 'Tu', 'We',
    ];

      List<Color> darkColors = [
        Color(0XFF4E4E61),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
        Color(0XFF4E4E61).withOpacity(.15), Color(0XFF4E4E61).withOpacity(.15),
      ];

    List<Color> lightColors = [
      Color(0XFFD3DAFF),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),
      Color(0XFFF1F1FF).withOpacity(.8), Color(0XFFF1F1FF).withOpacity(.8),

    ];

      List<Color>   dotColor = [
        Color(0XFFFF7966),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),
        Color(0XFF4E4E61).withOpacity(.01),  Color(0XFF4E4E61).withOpacity(.01),

      ];
    return SizedBox(
      height: MySize.scaleFactorHeight * 96,
      child: ListView.builder(
        itemCount: titleText.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Container(
            height: MySize.scaleFactorHeight * 103,
            width: MySize.size48,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border(
                top: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                // bottom: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
                left: BorderSide( color: Color(0XFFCFCFFC).withOpacity(.15)),
              ),

              color:  Provider.of<ThemeChanger>(context).themeData ==
                  darkMode
                  ? darkColors[index]
                  : lightColors[index],

            ),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 8, left: 10, bottom: 4)),
                Text( titleText[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? Color(0XFFFFFFFF)
                        : Color(0XFF1C1C23), // A2A2B5
                  ),
                ),
                Text( subtitleText[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? Color(0XFFA2A2B5)
                        : Color(0XFFA2A2B5), //
                  ),
                ),

                const Spacer(),
                CircleAvatar(backgroundColor: dotColor[index], radius: 3,),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        );
      },),
    );
  }
}