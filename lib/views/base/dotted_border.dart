import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

class DottedBorderWidget extends StatelessWidget {
  const DottedBorderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [10, 20],
      color: AppColors.grey30.withOpacity(.3),
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      // padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),

      ),
    );
  }
}