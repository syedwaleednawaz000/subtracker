  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
  import 'package:sub_tracker/generated/assets.dart';
  import 'package:sub_tracker/utils/app_constant.dart';
  import 'package:sub_tracker/views/base/text_widgets.dart';
  import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';

  class FieldContainer extends StatelessWidget {

    final Color containerColor;
    final Color textColor;
    final String mytitle;
    final String? myImage;



    const FieldContainer({
      super.key,
      required this.containerColor,
      required this.mytitle,
      required this.textColor,
      this.myImage,

    });

    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MySize.scaleFactorHeight * 48,
            // width: double.infinity,
            width: MySize.scaleFactorWidth * 333,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(MySize.size40),
              // image: myimage != null ? DecorationImage(image: myimage!, scale: 2) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(myImage!),
                if (myImage != null) Image.asset(myImage!, height: 19, width: 23,),
                SizedBox(width: 15,),
                Center(child: Text(mytitle,
                  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600,
                    color: textColor
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }