import 'package:flutter/material.dart';
import '../../../utils/my_size.dart';


class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomAppBar({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading:Image.asset('assets/icons/back_arrow.png', scale: 4.9,color: Color(0XFFA2A2B5),),
      title:  Text(text,style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
    );
  }
}
