import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';
class SettingRowList extends StatefulWidget {
  final String text;
  final String? text2;
  final Color? text2Color;
  final Widget? imageIcon;
  final Widget? icon;
  final Color? color;

  const SettingRowList({
    Key? key,
    required this.text,
    this.text2,
    this.icon,
    this.imageIcon,
    this.color,
    this.text2Color
  }) : super(key: key);

  @override
  State<SettingRowList> createState() => _SettingRowListState();
}

class _SettingRowListState extends State<SettingRowList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.imageIcon != null) // Check if imageIcon is provided
          Container(
            child: widget.imageIcon,
          ),
        SizedBox(width: 16),
        Text(
          widget.text,
          style: TextStyle(
              fontSize: MySize.size14,
              fontWeight: FontWeight.w600,
              color: widget.color
          ),
        ),

        const Spacer(),
        if (widget.text2 != null)
          Text( widget.text2!,
           style: TextStyle(
             fontSize: MySize.size12,
             fontWeight: FontWeight.w500,
             color: widget.text2Color,
           ),
          ),
        if (widget.text2 != null) SizedBox(width: MySize.size8),
        if (widget.icon != null) // Check if icon is provided
          widget.icon!,
      ],
    );
  }
}
