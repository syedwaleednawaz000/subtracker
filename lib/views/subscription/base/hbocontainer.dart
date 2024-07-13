import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

import '../../../utils/app_constant.dart';
import '../../../utils/my_size.dart';

class TresorlyContainer extends StatelessWidget {

  const TresorlyContainer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
    height:MySize.scaleFactorHeight*161 ,
    width:MySize.scaleFactorWidth*161 ,
    decoration: BoxDecoration(
     color: Colors.transparent ,

  borderRadius: BorderRadius.circular(45)
  ),
      child: AppConstant.tresorlyImage,
    );
  }
}
