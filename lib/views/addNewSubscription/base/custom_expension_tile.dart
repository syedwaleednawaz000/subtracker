import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../Utils/app_colors.dart';
import '../../../theme/theme.dart';

class CustomExpensionTile extends StatelessWidget {
  Widget? child;
  String title;
  CustomExpensionTile({super.key, required this.title,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:  Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF272730)
          : const Color(0XFFF7F7FF),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: Icon(
            Icons.keyboard_arrow_down,
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? Colors.white
                :  Colors.black,
          ),
          //iconColor: Colors.black,
          title: Text( title, style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                  ? Colors.white
                  : const Color(0XFF333339),
              fontFamily: 'Poppins_Regular'
          ),),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}