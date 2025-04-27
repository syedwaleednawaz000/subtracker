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
  String? Function(String?)? validator;
  TextEditingController? controller;
   FormFieldComponent({super.key,this.validator,this.controller,  this.height, required this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MySize.size30),
     // width: MySize.scaleFactorWidth*310,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(MySize.size4),
          border: Border.all(
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? const Color(0XFF757784)
                : const Color(0XFFE2E2E2),
            width: .5,
          )
      ) ,
      child: TextFormField(
        cursorColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Colors.white
          : Colors.black,
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        decoration:InputDecoration(
          contentPadding:  EdgeInsets.symmetric(horizontal: MySize.size15),
            hintText:hintText,
            hintStyle:TextStyle(
                fontSize: MySize.size14,
                fontWeight: FontWeight.w400,
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? const Color(0XFFD2D2D2).withOpacity(.8)
                    : const Color(0XFFD2D2D2),
                fontFamily: 'Poppins_Regular'
            ),
            border: InputBorder.none,
        ),
      ),
    );
  }
}
