import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../language_selection/base/custom_appBar.dart';


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
        child: Column(
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
            Container(
              height: MySize.size54,
              decoration: BoxDecoration(
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? Color(0XFF272730)
                    : Color(0XFFF7F7FF),
                boxShadow: [BoxShadow(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Color(0XFF101828).withOpacity(.2)
                        : Color(0XFF101828).withOpacity(.2),
                    offset: Offset(0, 1),
                    blurRadius: 2
                )],
                borderRadius: BorderRadius.all(Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:Row(
                      children: [
                        Text(
                          _selectedText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Color(0XFFFFFFFF)
                                : Color(0XFF333339),
                            fontFamily: 'Poppins_Regular',
                          ),
                        ),
                        Spacer(),
                        PopupMenuButton<int>(
                          icon: Icon(
                            Icons.expand_more,
                            size: 26,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Colors.white
                                : Color(0XFF333339),
                          ),
                          onSelected: (int value) {
                            setState(() {
                              switch (value) {
                                case 1:
                                  _selectedText = 'Account and Billing';
                                  break;
                                case 2:
                                  _selectedText = 'App Functionality';
                                  break;
                                case 3:
                                  _selectedText = 'Subscription Management';
                                  break;
                                case 4:
                                  _selectedText = 'Other Issues';
                                  break;
                                case 5:
                                  _selectedText = 'Data and Privacy';
                                  break;
                                case 6:
                                  _selectedText = 'Other Issues';
                                  break;
                              }
                            });
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text('Account and Billing'),
                            ),
                            PopupMenuItem<int>(
                              value: 2,
                              child: Text('App Functionality'),
                            ),
                            PopupMenuItem<int>(
                              value: 3,
                              child: Text('Subscription Management'),
                            ),
                            PopupMenuItem<int>(
                              value: 4,
                              child: Text('Other Issues'),
                            ),
                            PopupMenuItem<int>(
                              value: 5,
                              child: Text('Data and Privacy'),
                            ),
                            PopupMenuItem<int>(
                              value: 6,
                              child: Text('Other Issues'),
                            ),
                          ],
                        ),
                      ],
                    ),
                 ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
           RichText(text: TextSpan(
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
           )),

            const SizedBox(height: 15,),
            Container(
              height: 44, width: 331,
              decoration: BoxDecoration(
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? Color(0XFF272730)
                    : Color(0XFFF7F7FF),
                boxShadow: [BoxShadow(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Color(0XFF101828).withOpacity(.2)
                        : Color(0XFF101828).withOpacity(.2),
                    offset: Offset(0, 1),
                    blurRadius: 2
                )],
                borderRadius: BorderRadius.all(Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Lorem ipsum dolor sit ?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.expand_more, size: 26,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? Colors.white
                              : Color(0XFF333339),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 44, width: 331,
              decoration: BoxDecoration(
                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                    ? Color(0XFF272730)
                    : Color(0XFFF7F7FF),
                boxShadow: [BoxShadow(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Color(0XFF101828).withOpacity(.2)
                        : Color(0XFF101828).withOpacity(.2),
                    offset: Offset(0, 1),
                    blurRadius: 2
                )],
                borderRadius: BorderRadius.all(Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Lorem ipsum dolor sit ?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Colors.white
                                  : Color(0XFF333339),
                              fontFamily: 'Poppins_Regular'
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.expand_more, size: 26,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                              ? Colors.white
                              : Color(0XFF333339),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

