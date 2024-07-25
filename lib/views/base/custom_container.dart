import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/notification_screen/notification_screen.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/language_selection/language_selection.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import 'circular_ProgressBar.dart';
import 'linecolor_container.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: MySize.scaleFactorHeight * 465,
          // width: MySize.scaleFactorWidth * 405,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            border: Border.all(color: AppColors.white20.withOpacity(.2)),
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF353542)
                : const Color(0XFFFFFFFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(385, 429),
                    painter: DottedArcPainterC(strokeWidth: 3,
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFF353542)
                        : const Color(0XFFFFFFFF),),
                  ),
                  CustomPaint(
                    size: const Size(298, 300), // Adjust size as needed
                    painter: DottedArcPainter(strokeWidth: 3,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF353542)
                          : const Color(0XFFFFFFFF),),
                  ),
                  CustomPaint(
                    size: const Size(200, 10), // Adjust size as needed
                    painter: DottedArcPainter(strokeWidth: 3,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? const Color(0XFF4E4E61)
                          : const Color(0XFF4E4E61),),
                  ),
                  const CircularProgressBarWidget(),
                  Padding(
                    padding:  EdgeInsets.only(top: MySize.scaleFactorHeight*355),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LineColorContainer(
                          borderColor: AppColors.pinkLine,
                          titleText: 'Active subs',
                          numberCount: '12',
                        ),
                        SizedBox(
                          width: MySize.scaleFactorWidth * 14,
                        ),
                         const LineColorContainer(
                          borderColor: AppColors.purpleLine,
                          titleText: 'Highest subs',
                          numberCount: '\$19.99',
                                                 ),
                        const SizedBox(
                          width: 14,
                        ),
                        const LineColorContainer(
                          borderColor: AppColors.accentLine,
                          titleText: 'Lowest subs',
                          numberCount: '\$5.99',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 24,
                    top: 33,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                      },
                      child: Image.asset('assets/icons/alert.png', height: 25, width: 25,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? const Color(0XFFC1C1CD)
                              :  const Color(0XFFC1C1CD)
                      ),
                    ),)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DottedSemicirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  DottedSemicirclePainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Draw the half dotted circle
    final Path path = Path();
    path.arcTo(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      3.14,
      3.14,
      false,
    );

    final Path dashedPath = createDottedPath(path, 5);
    canvas.drawPath(dashedPath, paint);
  }

  Path createDottedPath(Path path, double dashWidth) {
    final Path dottedPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final Path extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        dottedPath.addPath(extractPath, Offset.zero);
        distance += dashWidth * 2; // Gap between dashes
      }
    }
    return dottedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class DottedArcPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  DottedArcPainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final Path path = Path();
    path.addArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 1.7),
      degToRad(-225),
      degToRad(360 - 90), // Drawing from -290 degrees to 260 degrees
    );

    final Path dashedPath = createDottedPath(path, 1);
    canvas.drawPath(dashedPath, paint);
  }

  Path createDottedPath(Path path, double dashWidth) {
    final Path dottedPath = Path();
    double distance = 1.7;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final Path extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        dottedPath.addPath(extractPath, Offset.zero);
        distance += dashWidth * 20; // Gap between dashes
      }
    }
    return dottedPath;
  }

  double degToRad(double degree) {
    return degree * 3.141592653589793 / 180.0;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class DottedArcPainterC extends CustomPainter {
  final double strokeWidth;
  final Color color;

  DottedArcPainterC({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final Path path = Path();
    path.addArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      degToRad(-165),
      degToRad(200 - 50), // Drawing from -290 degrees to 260 degrees
    );

    final Path dashedPath = createDottedPath(path, 1);
    canvas.drawPath(dashedPath, paint);
  }

  Path createDottedPath(Path path, double dashWidth) {
    final Path dottedPath = Path();
    double distance = 1.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final Path extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        dottedPath.addPath(extractPath, Offset.zero);
        distance += dashWidth * 20; // Gap between dashes
      }
    }
    return dottedPath;
  }

  double degToRad(double degree) {
    return degree * 3.141592653589793 / 180.0;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

