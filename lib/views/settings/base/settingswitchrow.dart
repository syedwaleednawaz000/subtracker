import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';
import '../../base/text_widgets.dart';

class SettingSwitchRow extends StatefulWidget {
  final String text;
  final Widget? imageIcon;

  const SettingSwitchRow({
    Key? key,
    required this.text,
    this.imageIcon,
  }) : super(key: key);

  @override
  _SettingSwitchRowState createState() => _SettingSwitchRowState();
}

class _SettingSwitchRowState extends State<SettingSwitchRow> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: widget.imageIcon,
        ),
        SizedBox(width: MySize.size16),
        Text( widget.text   ,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        ),
        // TextWidgetInterBold(
        //   title: widget.text,
        //   color: AppColors.whiteFF,
          // fontSize: MySize.size14,
          // fontWeight: FontWeight.w600,
        // ),
         Spacer(),
        Switch(
          value: _switchValue,

          onChanged: (bool newvalue)  {
            setState(() {
              _switchValue = newvalue;
            });
          },
          activeTrackColor: Color(0XFF4E4E61),
          // focusColor: Colors.pink,
          autofocus: true,
          // inactiveThumbColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : AppColors.purpleFF,
          thumbColor: MaterialStateProperty.all(Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : Colors.white),
          inactiveTrackColor:  Color(0XFF4E4E61),
          trackOutlineColor: const MaterialStatePropertyAll(Color(0x00000000)),
        ),
      ],
    );
  }
}
