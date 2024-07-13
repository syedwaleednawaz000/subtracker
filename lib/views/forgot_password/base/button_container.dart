import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  const ButtonContainer({super.key, required this.title, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySize.size40),
          color: Color(0XFF758AFF)),
      child: Center(
        child: TextWidgetInterRegular(
            title: title,
            fontSize:MySize.size14,
            // color: Colors.white,
            fontWeight: FontWeight.w500

        ),
      ),
    );
  }
}
