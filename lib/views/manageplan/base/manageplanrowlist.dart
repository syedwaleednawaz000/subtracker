import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/theme/theme.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';


class manageplanrowlist extends StatefulWidget {
  final String text;
  final Widget? imageIcon;

  const manageplanrowlist(
      {super.key,
        required this.text,
        this.imageIcon,
      });

  @override
  State<manageplanrowlist> createState() => _manageplanrowlistState();
}

class _manageplanrowlistState extends State<manageplanrowlist> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: widget.imageIcon,
        ),
        SizedBox(
          width: MySize.size20,
        ),
        Text( widget.text,
        style: TextStyle(
            color: Provider.of<ThemeChanger>(context).themeData ==
            darkMode
            ? Colors.white
            : Color(0XFF424252),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          fontFamily: 'Inter-Regular'
        ),),

      ],
    );
  }
}
