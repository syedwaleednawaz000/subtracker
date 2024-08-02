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
    return Container(
      height: MySize.scaleFactorHeight * 68,
      width: MySize.scaleFactorWidth * 104,
      decoration: BoxDecoration(
        color: Provider.of<ThemeChanger>(context)
            .themeData ==
            darkMode
            ? const Color(0xFF4E4E61)
            .withOpacity(0.20)
            : const Color(0xFFCFCFFC)
            .withOpacity(0.3),
        borderRadius: BorderRadius.circular(MySize.size16),
      ),
      child: CustomPaint(
        painter: CustomBorderPainter(borderColor: borderColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleText,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: MySize.size12,
                fontWeight: FontWeight.w600,
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFF83839C)
                    : const Color(0XFF83839C),
              ),
            ),
            SizedBox(height: MySize.size2),
            Text(
              numberCount,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w600,
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFFFFFFFF)
                    : const Color(0XFF424252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBorderPainter extends CustomPainter {
  final Color borderColor;

  CustomBorderPainter({required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    double borderLength =
        size.width * 0.5;
    double startX = (size.width - borderLength) / 2;
    path.moveTo(startX, 0);
    path.lineTo(startX + borderLength, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sub_tracker/views/base/text_widgets.dart';
//
// import '../../theme/theme.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/my_size.dart';
//
// class LineColorContainer extends StatelessWidget {
// final String titleText;
// final String numberCount;
// final Color borderColor;
//   const LineColorContainer({
//     super.key,
//     required this.titleText,
//     required this.numberCount,
//     required this.borderColor,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: MySize.scaleFactorHeight * 68,
//       width: MySize.scaleFactorWidth * 104,
//       decoration: BoxDecoration(
//         gradient:  LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFCFCFFC).withOpacity(0.15),
//             const Color(0xFFCFCFFC).withOpacity(0),
//
//           ],
//         ),
//         borderRadius: BorderRadius.circular(MySize.size16),
//         border: Border(top: BorderSide(color: borderColor,),),
//         // color: Provider.of<ThemeChanger>(context).themeData == darkMode
//         //   ? const Color(0XFF4E4E61).withOpacity(.2)
//         //   : const Color(0XFFF7F7FF),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(titleText,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontSize: MySize.size12,
//               fontWeight: FontWeight.w600,
//               color: Provider.of<ThemeChanger>(context).themeData ==
//                   darkMode
//                   ? const Color(0XFF83839C)
//                   : const Color(0XFF83839C),
//             ),
//           ),
//           SizedBox(height: MySize.size2,),
//
//           Text( numberCount,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               fontSize: MySize.size14,
//               fontWeight: FontWeight.w600,
//               color: Provider.of<ThemeChanger>(context).themeData ==
//                   darkMode
//                   ? const Color(0XFFFFFFFF)
//                   : const Color(0XFF424252),
//             ),
//           ),
//         ],
//       ),
//     );
//
//
//
//   }
// }
