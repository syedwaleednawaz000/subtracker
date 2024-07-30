import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class MonthlyPercentWidget extends StatelessWidget {
  String packageTitle;
   MonthlyPercentWidget({required this.packageTitle,super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: MySize.size64,
     // bottom: MySize.size2,
      left: MySize.scaleFactorHeight * 145,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: MySize.size4),
       // height: MySize.scaleFactorHeight * 20,
        width: MySize.scaleFactorWidth * 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySize.size12),
            boxShadow: const [
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
          child: Text(packageTitle,
          style: TextStyle(
              fontSize: MySize.size8,
              fontWeight: FontWeight.w500,
            color: Colors.white
          ),
          ),
        ),
      ),
    );
  }
}



class MonthlyPercentWidget2 extends StatelessWidget {
  const MonthlyPercentWidget2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      // left: 132,
      // top: 192,
      top: MySize.scaleFactorHeight * 114,
      left: MySize.scaleFactorHeight * 156,
      child: Container(
        // margin: EdgeInsets.only(left: 20),
       // height: MySize.scaleFactorHeight * 20,
        width: MySize.scaleFactorWidth * 105,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySize.size12),
            boxShadow: const [
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
          child: Text('1 Month Free Trial',
            style: TextStyle(
                fontSize: MySize.size8,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
