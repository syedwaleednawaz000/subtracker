import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class SubscribeStackWidget extends StatelessWidget {
  const SubscribeStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned(
          left: .1,
          top: .8,
          // top: MySize.scaleFactorHeight* 195,
          // left: MySize.scaleFactorWidth* 135,
          // right: MySize.scaleFactorWidth* 135,
          child: Container(
            height: MySize.scaleFactorHeight * 20,
            width: MySize.scaleFactorWidth * 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySize.size12),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.purpleBE,
                    spreadRadius: 1,
                    blurRadius: 25,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: AppColors.purpleFF,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: AppColors.purpleFF,
                    offset: Offset(5,0),
                  )
                ]
            ),
            child: Center(
              child: TextWidgetInterMedium(
                  title: 'Subscribed',
                  // color: AppColors.whiteFF,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
