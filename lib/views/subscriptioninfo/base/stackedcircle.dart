import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/my_size.dart';

class StackedCircle extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;

  const StackedCircle({super.key, this.top, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left:left,
      right: right,
      child: Container(
        height:MySize.size26 ,
        width:MySize.size26,
        decoration: BoxDecoration(
          color: Provider.of<ThemeChanger>(context).themeData ==
              darkMode
              ? Color(0XFF131318)
              : Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(MySize.size32),
        ),

      ),
    );
  }
}
