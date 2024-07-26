import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';

class TermsOfServices extends StatelessWidget {
  const   TermsOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? Color(0XFF1C1C23)
          : Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset(AppImages.backArrow, height: 24,width: 24,)),
                      SizedBox(
                        width: MySize.scaleFactorWidth * 90,
                      ),
                      Text('Terms of Service',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: MySize.size16,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Color(0XFFA2A2B5)
                                : Color(0XFF333339),
                            fontFamily: 'Poppins_Regular'
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Terms of Service',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? Color(0XFFEEEEEE)
                              : Color(0XFF1C1C23),
                          fontFamily: 'Poppins_Regular'
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppImages.privText,
                        style:  TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : Color(0XFF333339),
                            fontFamily: 'Poppins_Regular'
                        ),
                    )
                  ),
                ),
                SizedBox(
                  height: MySize.size18,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: MySize.size32, right: MySize.size20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            'Diam quam dignissim dignissim tellus tellus eu\nsed a. Et nec suspendisse ante sed odio sit mauris\nnec sit. Adipiscing ipsum lacus in penatibus tortor\nfaucibus nisl diam.',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),),
                          TextSpan(
                            text: ' Aenean non ut malesuada\n ',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                          TextSpan(
                            text:
                            'gravida vel integer suspendisse arcu velit. Facilisis\nvel lectus a nisi. Vitae donec ipsum eu nulla\npellentesque semper. Dapibus egestas diam mi\neleifend risus nunc enim.',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                          TextSpan(
                            text:
                            ' Natoque pellentesque\namet interdum ut felis. Vitae integer posuere\n',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                          TextSpan(
                            text:
                            'euismod ut amet. Diam amet egestas pretium a\nultrices auctor cras scelerisque. In porttitor sed.',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size18,
                ),
                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppImages.privText,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : Color(0XFF333339),
                            fontFamily: 'Poppins_Regular'
                        ),
                    )
                  ),
                ),
                SizedBox(
                  height: MySize.size18,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: MySize.size32, right: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            'Diam quam dignissim dignissim tellus tellus eu\nsed a. Et nec suspendisse ante sed odio sit mauris\nnec sit. Adipiscing ipsum lacus in penatibus tortor\nfaucibus nisl diam.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                          TextSpan(
                            text: 'Aenean non ut malesuada\n ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                          TextSpan(
                            text:
                            'gravida vel integer suspendisse arcu velit. Facilisis\nvel lectus a nisi. Vitae donec ipsum eu nulla\npellentesque semper. Dapibus egestas diam mi\neleifend risus nunc enim.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? Colors.white
                                    : Color(0XFF333339),
                                fontFamily: 'Poppins_Regular'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
