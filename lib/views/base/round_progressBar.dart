import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';


class RoundProgessBar extends StatelessWidget {
  const RoundProgessBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.aspectRatio(aspectRatio: 1.8,
      // dimensions: MySize.scaleFactorWidth * 210,
      startAngle: MySize.scaleFactorWidth * 257,
      sweepAngle: MySize.scaleFactorHeight * 200,
      progress: MySize.scaleFactorHeight * 100,
      maxProgress: MySize.scaleFactorWidth * 270,
      foregroundColor: Color(0XFF03E4E7),
      backgroundColor: Color(0XFF758AFF),
      foregroundStrokeWidth: MySize.scaleFactorWidth * 10,
      backgroundStrokeWidth: MySize.scaleFactorWidth * 7,
      foregroundGapSize: MySize.scaleFactorHeight * 5,
      foregroundDashSize: MySize.scaleFactorWidth * 55,
      backgroundGapSize: MySize.scaleFactorWidth * 5,
      backgroundDashSize: MySize.scaleFactorWidth * 55,
      child: Padding(
        padding:  EdgeInsets.only(top: MySize.size28, bottom: MySize.size16),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextWidgetInterBold(
                title: '\$8297',
                fontSize: MySize.size24,
                // color: AppColors.white100
            ),
            SizedBox(height: MySize.size10,),
            Text('of \$2,000 budget',
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFFA2A2B5)
              ),

            ),
          ],
        ),
      ),
    );
  }
}