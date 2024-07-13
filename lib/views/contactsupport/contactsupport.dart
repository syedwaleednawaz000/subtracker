import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import '../../theme/theme.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../settings/settings.dart';
import 'base/formfieldcomponent.dart';


class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
            ? Color(0XFF1C1C23)
            : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: MySize.size25),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppBar(
                  scrolledUnderElevation: 0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading:Image.asset('assets/icons/back_arrow.png', scale: 4.9,color: Color(0XFFA2A2B5),),
                  title:  Text('Spending & Budgets',style: TextStyle(color: Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
                )
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: const EdgeInsets.only(left: 38, right: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: MySize.size20,),
                Text('Generate Ticket',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFEEEEEE)
                          : Color(0XFF333339),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                Text('Issue',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFEEEEEE)
                          : Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                DropdownMenu(
                  textStyle:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? Color(0XFFFFFFFF)
                        : Color(0XFFD2D2D2),
                ),
                  width: MySize.scaleFactorWidth* 340,
                    inputDecorationTheme: InputDecorationTheme(
                      constraints: BoxConstraints(
                        maxWidth: 330,
                        maxHeight: 50
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? Color(0XFF757784)
                                  : Color(0XFFE2E2E2),),
                        borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide:  BorderSide(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                ? Color(0XFF757784)
                                : Color(0XFFE2E2E2),
                        ),
                      ),
                      isDense: true,

                    ),
                    dropdownMenuEntries: [
                  DropdownMenuEntry(value: 1, label: 'Account and Billing', ),
                  DropdownMenuEntry(value: 2, label: 'App Functionality',),
                  DropdownMenuEntry(value: 3, label: 'Subscription Management',),
                  DropdownMenuEntry(value: 4, label: 'Other Issues',),
                  DropdownMenuEntry(value: 5, label: 'Data and Privacy',),
                  DropdownMenuEntry(value: 6, label: 'Other Issues',),
                ],
                trailingIcon: Icon(Icons.expand_more),
                ),

                SizedBox(height: MySize.size14,),
                Text( 'Subject',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFEEEEEE)
                          : Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                const FormFieldComponent(
                  maxLines: null,
                  hintText: 'Enter Subject',

                ),
                SizedBox(height: MySize.size14,),
                Text('Description',
                  style: TextStyle(
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                          ? Color(0XFFEEEEEE)
                          : Color(0XFF424252),
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(height: MySize.size10,),
                FormFieldComponent(
                  hintText: 'Enter Description',
                  height: MySize.scaleFactorHeight* 210,
                  maxLines:7,
                ),
              ],
            ),
          ),

            Spacer(),
      Container(
        height: 114,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                ? Color(0XFF353542)
                : Color(0XFFF1F1FF).withOpacity(.8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: AppColors.black00.withOpacity(.25)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
              child: Container(
                  height: 48,
                  width: 288,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? Color(0XFFFFFFFF).withOpacity(.16)
                          : Color(0XFFF1F1FF),
                      border: Border(
                          top: BorderSide(color: Colors.white.withOpacity(.15)),
                          left: BorderSide(color: Colors.white.withOpacity(.15)),
                          // right: BorderSide(color: Colors.white.withOpacity(.5)),
                          bottom: BorderSide.none
                      ),
                      // border: Border.all(
                      //     color: Color(0XFFFFFFFF).withOpacity(.1))
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                        Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? Color(0XFFFFFFFF)
                            : Color(0XFF1c1c23),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      )
          ],
        ),
      ),
    );
  }
}
