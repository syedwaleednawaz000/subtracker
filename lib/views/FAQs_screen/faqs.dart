import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';
import '../subscription/base/custom_expension_tile.dart';


class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  String _selectedText = 'Lorem ipsum dolor sit ?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
          ? const Color(0XFF1C1C23)
          : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only( top: MySize.size25),
          child:  CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'FAQs',
            icon: Icons.arrow_back_rounded,
          ),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, top: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 18),
                  child: Text('Frequently Asked Questions',
                    style: TextStyle(
                      fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Colors.white
                        : Color(0XFF333339),
                      fontFamily: 'Poppins_Regular'
                    ),
                  )
                ),
                CustomExpensionTile(
                  title: 'Lorem Ipsum dolor sit?',
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          'Lorem ipsum dolor sit amet consectetur. Auctor urna et at faucibus cras. Consectetur sed lorem aliquet '
                              'adipiscing sit in porttitor viverra. Erat maecenas euismod a dictum. Interdum massa senectus ultricies '
                              'malesuada scelerisque sed \n\nDiam quam dignissim dignissim tellus tellus eu sed a. Et nec suspendisse ante sed'
                              ' odio sit mauris nec sit. Adipiscing ipsum lacus in penatibus tortor faucibus nisl diam. ',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339).withOpacity(.8),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: 'Aenean non ut malesuada',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' gravida vel integer suspendisse arcu velit. Facilisis vel lectus a nisi. Vitae donec ipsum eu nulla '
                              'pellentesque semper. Dapibus egestas diam mi eleifend risus nunc enim.',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' Natoque pellentesque amet interdum ut felis. Vitae integer posuere',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' euismod ut amet. Diam amet egestas pretium a ultrices auctor cras scelerisque. In porttitor sed',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                      ]
                  )) ,

                ),
                SizedBox(height: MySize.size15,),
                CustomExpensionTile(
                  title: 'Lorem Ipsum dolor sit ?',
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          'Lorem ipsum dolor sit amet consectetur. Auctor urna et at faucibus cras. Consectetur sed lorem aliquet '
                              'adipiscing sit in porttitor viverra. Erat maecenas euismod a dictum. Interdum massa senectus ultricies '
                              'malesuada scelerisque sed \n\nDiam quam dignissim dignissim tellus tellus eu sed a. Et nec suspendisse ante sed'
                              ' odio sit mauris nec sit. Adipiscing ipsum lacus in penatibus tortor faucibus nisl diam. ',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339).withOpacity(.8),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: 'Aenean non ut malesuada',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' gravida vel integer suspendisse arcu velit. Facilisis vel lectus a nisi. Vitae donec ipsum eu nulla '
                              'pellentesque semper. Dapibus egestas diam mi eleifend risus nunc enim.',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' Natoque pellentesque amet interdum ut felis. Vitae integer posuere',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' euismod ut amet. Diam amet egestas pretium a ultrices auctor cras scelerisque. In porttitor sed',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                      ]
                  )) ,

                ),
                SizedBox(height: MySize.size15,),
                CustomExpensionTile(
                  title: 'Lorem Ipsum dolor sit?',
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          'Lorem ipsum dolor sit amet consectetur. Auctor urna et at faucibus cras. Consectetur sed lorem aliquet '
                              'adipiscing sit in porttitor viverra. Erat maecenas euismod a dictum. Interdum massa senectus ultricies '
                              'malesuada scelerisque sed \n\nDiam quam dignissim dignissim tellus tellus eu sed a. Et nec suspendisse ante sed'
                              ' odio sit mauris nec sit. Adipiscing ipsum lacus in penatibus tortor faucibus nisl diam. ',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339).withOpacity(.8),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: 'Aenean non ut malesuada',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' gravida vel integer suspendisse arcu velit. Facilisis vel lectus a nisi. Vitae donec ipsum eu nulla '
                              'pellentesque semper. Dapibus egestas diam mi eleifend risus nunc enim.',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' Natoque pellentesque amet interdum ut felis. Vitae integer posuere',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        TextSpan(
                          text: ' euismod ut amet. Diam amet egestas pretium a ultrices auctor cras scelerisque. In porttitor sed',
                          style:  TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFFFFFFFF).withOpacity(.7)
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                      ]
                  )) ,

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

