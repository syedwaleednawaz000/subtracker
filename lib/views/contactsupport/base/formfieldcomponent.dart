import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';

class FormFieldComponent extends StatelessWidget {
  final int? maxLines;
  final String hintText;
  final double? height;
  const FormFieldComponent({super.key,  this.height, required this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(MySize.size4),
          border: Border.all(
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? Color(0XFF757784)
                : Color(0XFFE2E2E2),
            width: .5,
          )
      ) ,
      child: TextFormField(
        maxLines: maxLines,
        decoration:InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText:hintText,
            hintStyle:TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w400,
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? Color(0XFFD2D2D2).withOpacity(.8)
                    : Color(0XFFD2D2D2),
                fontFamily: 'Poppins_Regular'
            ),
            // TextStyle(color: AppColors.whiteFF.withOpacity(.6),fontSize: MySize.size14,fontWeight: FontWeight.w400),
            border: InputBorder.none,
        ),
      ),
    );
  }
}
