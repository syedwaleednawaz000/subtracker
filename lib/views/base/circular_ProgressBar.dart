import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class CircularProgressBarWidget extends StatelessWidget {
  String totalBudget ;
  String monlthyBill;
   CircularProgressBarWidget({
    super.key,
    required this.totalBudget,
    required this.monlthyBill,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(400, 200),
    // size: Size(double.infinity, MySize.scaleFactorHeight * 265),
    painter: CircularSeekBarShadowPainter(),),
        CircularSeekBar(
          width: double.infinity,
          height: MySize.scaleFactorHeight * 305,
          progress: MySize.scaleFactorWidth * 90,
          barWidth: MySize.scaleFactorWidth * 7,
          startAngle: MySize.scaleFactorWidth * 43,
          sweepAngle: MySize.scaleFactorWidth * 260,
          // trackColor: Color(0XFF4E4E61), /*4E4E61*/
          trackColor: Colors.grey, /*4E4E61*/
          // strokeCap: StrokeCap.square,
          progressColor: Color(0XFF758AFF),
          // progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple],
          // innerThumbStrokeWidth: 10,

          outerThumbColor: Colors.blueAccent,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                SizedBox(height: 54,),

             Provider.of<ThemeChanger>(context).themeData == darkMode
              ? Image.asset(
                'assets/images/logo.png',
               width: MySize.scaleFactorWidth * 162,
               height: MySize.scaleFactorHeight *  74,

              )
              : Image.asset(
               'assets/images/logo2.png',
               width: MySize.scaleFactorWidth * 182,
               height: MySize.scaleFactorHeight *  56,

             ),
              const SizedBox(height: 8,),
              Text( '\$ ${monlthyBill == null ?"${monlthyBill}":"0"}',
                style: TextStyle(
                  fontSize: MySize.size40,
                  fontWeight: FontWeight.w700,
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? Color(0XFFFFFFFF)
                      : Color(0XFF424252),
                ),
              ),
              SizedBox(height: 14,),
              Text('This months bills',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: MySize.size12,
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? Color(0XFF83839C)
                      : Color(0XFF83839C),
                ),
              ),

              SizedBox(height: 15),
              Container(
                // Padding(
                //   padding: EdgeInsets.only( bottom: MySize.scaleFactorHeight * 24),
                height: 32,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Provider.of<ThemeChanger>(context).themeData ==
                      darkMode
                      ? Color(0XFFFFFFFF).withOpacity(.10)
                      : Color(0XFFF1F1FF),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('See your budget',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: MySize.size12,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Color(0XFFFFFFFF)
                            : Color(0XFF424252),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class CircularSeekBarShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0XFF4F63BE).withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 23);

    final outerRadius = size.width / 2.9;
    final innerRadius = size.width / 3.2;


    final path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: outerRadius))
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: innerRadius))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
