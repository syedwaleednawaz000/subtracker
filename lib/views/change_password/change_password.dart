import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/auth/signUp/sigup_screen.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../theme/theme.dart';
import '../base/field_container.dart';
import '../language_selection/base/custom_appBar.dart';
import '../personaldata/personaldata.dart';
import '../settings/settings.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF1C1C23) : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: 4, top: 25  ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CustomAppBar(
                text: 'Change Password',
                icon: Icons.arrow_back_rounded,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 38, right: 37),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password',
                        style: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680) : Color(0XFF666680),
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(left: 20, right: 20),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                            fontSize: MySize.size12,
                          ),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Password',
                        style: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680) : Color(0XFF666680),
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(left: 20, right: 20),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                            fontSize: MySize.size12,
                          ),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Confirm Password',
                        style: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680) : Color(0XFF666680),
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(left: 20, right: 20),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                            fontSize: MySize.size12,
                          ),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF666680).withOpacity(.6) : Color(0XFF666680).withOpacity(.6),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 28, ),
                    child: StepProgressIndicator(totalSteps: 4,
                     selectedColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                     unselectedColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1),
                      // gradientColor: LinearGradient(
                      //     colors: [Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0XFF353542) : Color(0XFF353542).withOpacity(.1)]),\
                    ),
                  ),

                ],
              ),
            ),
            Spacer(),
            CustomSaveButton(
              titleText: 'Save',
            ),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
            //   },
            //   child: Container(
            //     height: 114, width: double.infinity,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [Color(0XFF1C1C23), Color(0XFF3F3F4B)]),
            //         borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            //         boxShadow: [
            //           BoxShadow(
            //               offset: Offset(0, 4),
            //               blurRadius: 4,
            //               color: AppColors.black00.withOpacity(.25)
            //           )
            //         ]
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //             height: 48, width: 288,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(40),
            //                 color: Color(0XFFFFFFFF).withOpacity(.15),
            //                 border: Border.all(color: Color(0XFFFFFFFF).withOpacity(.1))
            //             ),
            //             child: Center(child: TextWidgetInterMedium(title: 'Save',
            //                 // color: Colors.white
            //             ))),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ));
  }
}
