

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class LineColorContainer extends StatelessWidget {
final String titleText;
final String numberCount;
final Color borderColor;
  const LineColorContainer({
    super.key,
    required this.titleText,
    required this.numberCount,
    required this.borderColor,

  });

  @override
  Widget build(BuildContext context) {

    // List<String> LineColors = ['${AppColors.purpleLine}', '${AppColors.pinkLine}', '${AppColors.lightBlue}'];

    return Container(
      height: MySize.scaleFactorHeight * 68,
      width: MySize.scaleFactorWidth * 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border(top: BorderSide(color: borderColor,),),
        color: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Color(0XFF4E4E61).withOpacity(.2)
          : Color(0XFFF7F7FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titleText,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: MySize.size12,
              fontWeight: FontWeight.w400,
              color: Provider.of<ThemeChanger>(context).themeData ==
                  darkMode
                  ? Color(0XFF83839C)
                  : Color(0XFF83839C),
            ),
          ),

          Text( numberCount,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: MySize.size14,
              fontWeight: FontWeight.w400,
              color: Provider.of<ThemeChanger>(context).themeData ==
                  darkMode
                  ? Color(0XFFFFFFFF)
                  : Color(0XFF424252),
            ),
          ),
        ],
      ),
    );

  // return  Container(
  //   height: MySize.scaleFactorHeight * 68,
  //   width: MySize.scaleFactorWidth * 104,
  //   decoration: BoxDecoration(
  //     // color: AppColors.grey20.withOpacity(.2),
  //     color: Color(0XFF4E4E61).withOpacity(.2),
  //     borderRadius: BorderRadius.circular(16),// Set background color if needed
  //     border: const Border(
  //       top: BorderSide.none, // No top border initially
  //       left: BorderSide(color: Colors.grey, width: 1),
  //       right: BorderSide.none,
  //       bottom: BorderSide(color: Colors.grey, width: 1),
  //     ),
  //   ),
  //   child: Stack(
  //     children: [
  //       Positioned(
  //         left: 25,
  //         right: 25,
  //         top: 0,
  //         child: Container(
  //           height: 1,
  //           color: AppColors.purpleLine,
  //         ),
  //       ),
  //       Positioned(
  //         left: 10,
  //         right: 25,
  //         bottom: 0,
  //         child: Container(
  //           height: 1,
  //           color: Color(0XFFCFCFFC).withOpacity(.15),
  //         ),
  //       ),
  //
  //   Center(
  //     child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             TextWidgetInterMedium(
  //                 title: titleText,
  //                 fontSize: MySize.size12,
  //                 color: const Color(0XFF83839C)
  //             ),
  //             TextWidgetInterMedium(
  //                 title: numberCount,
  //                 fontSize: MySize.size14,
  //                 color: AppColors.white100),
  //           ],
  //         ),
  //   ),
  //     ],
  //   ),
  // );

  }
}