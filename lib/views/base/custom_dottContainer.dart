import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';



class CustomDottContainer extends StatelessWidget {
  const CustomDottContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: DottedBorder(
        dashPattern: [MySize.size6, MySize.size8],
        color: AppColors.white30.withOpacity(.3),
        child: Container(
        height: MySize.scaleFactorHeight * 84,
        width: MySize.scaleFactorWidth * 320,
          // color: AppColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidgetInterMedium(title: 'Add new Category',
              // color: AppColors.grey30,
            ),
            SizedBox(width: MySize.size24,),
            Icon(Icons.add_circle_outline_sharp, color: AppColors.grey30) /* Color code A2A2B5 */
          ],
        ),
            ),),
    );
  }
}