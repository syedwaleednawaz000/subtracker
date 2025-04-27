import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class SubscribeStackWidget extends StatelessWidget {
  const SubscribeStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: MySize.scaleFactorHeight *1,
      left: MySize.scaleFactorWidth*88,
      // right: MySize.scaleFactorWidth* 135,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
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
              title:  AppLocalizations.of(context)!.subscribed,
              color: AppColors.whiteFF,
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
