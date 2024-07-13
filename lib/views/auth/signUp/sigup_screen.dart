import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/my_size.dart';
import 'package:sub_tracker/views/base/text_widgets.dart';

import '../../../theme/theme.dart';
import '../../../utils/app_Images.dart';
import '../../base/field_container.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool val = false;
  bool isSelected = false;
  bool isSelected1 = false;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: Color(0XFF1C1C23),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28, bottom: 165, left: 115, right: 115),
                ),
                Text( 'Create Account',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 24,
                      color: Colors.white
                  ),),
               Padding(
                 padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                 child: Column(
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('E-mail address',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Color(0XFF666680),
                           ),),
                        // color: Color(0XFF666680),
                         const SizedBox(
                           height: 4,
                         ),
                         TextFormField(
                           style: TextStyle(
                                color:  Color(0XFF666680)
                           ),
                           decoration: InputDecoration(
                              isDense: true,
                               contentPadding: EdgeInsets.only(left: 20, right: 20),
                               hintText: 'Email',
                               hintStyle:  TextStyle(
                                 fontFamily: 'Poppins_Regular',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: Color(0XFF666680).withOpacity(.3),
                               ),
                               // hintStyle: TextStyle(color: Color(0XFF666680)),
                               suffixIcon: Icon(Icons.email, color: Color(0XFF666680).withOpacity(.3),),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(16),
                                   borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2))),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(16),
                               borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(16),
                               borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                             ),
                           ),
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('Password',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Color(0XFF666680)
                           ),),
                         SizedBox(
                           height: 4,
                         ),
                         TextFormField(
                           style: TextStyle(
                               color:  Color(0XFF666680)
                           ),
                         obscureText: isSelected,
                           decoration: InputDecoration(
                               isDense: true,
                               contentPadding: EdgeInsets.only(left: 20, right: 20),
                               hintText: 'Passwod',
                               hintStyle:  TextStyle(
                                 fontFamily: 'Poppins_Regular',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: Color(0XFF666680).withOpacity(.3),
                               ),
                               suffixIcon: IconButton(onPressed: (){
                                 setState(() {
                                   isSelected = !isSelected;
                                 });
                               }, icon: isSelected
                                   ? Icon(Icons.lock, color: Color(0XFF666680).withOpacity(.3),)
                                   : Icon(Icons.lock_open, color: Color(0XFF666680).withOpacity(.3),)),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(16),
                                   borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2))),
                                   focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(16),
                             borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(16),
                             borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
            
                               )
                           ),
            
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('Confirm Password',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Color(0XFF666680)
                           ),),
                         SizedBox(
                           height: 4,
                         ),
                         TextFormField(
                           style: TextStyle(
                               color:  Color(0XFF666680)
                           ),
                           obscureText: isSelected1,
                           decoration: InputDecoration(
                             contentPadding: EdgeInsets.only(left: 20, right: 20),
                               isDense: true,
                               hintText: 'Confirm Password',
                               hintStyle:  TextStyle(
                                 fontFamily: 'Poppins_Regular',
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: Color(0XFF666680).withOpacity(.3),
                               ),
                               suffixIcon: IconButton(onPressed: (){
                                 setState(() {
                                   isSelected1 = !isSelected1;
                                 });
                               }, icon: isSelected1
                                   ? Icon(Icons.lock, color: Color(0XFF666680).withOpacity(.3),)
                                   : Icon(Icons.lock_open, color: Color(0XFF666680).withOpacity(.3),)),
                               border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(16),
                                   borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2))),
                               focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16),
                           borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                         ),
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16),
                   borderSide: BorderSide(color: Color(0XFF4E4E61).withOpacity(.2)),
                 ),
                           ),
            
                         ),
                       ],
                     ),
            
                    const Padding(
                       padding: EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 16),
                       child: StepProgressIndicator(totalSteps: 4, gradientColor: LinearGradient(colors: [Color(0XFF353542),Color(0XFF353542) ]),),
                     ),
            
                     Padding(
                       padding: const EdgeInsets.only(left: 7),
                       child: Align(
                         alignment: Alignment.centerLeft,
                         child: Text('Use 8 or more characters with a mix of letters, \nnumbers & symbols to be secure.',
                           textAlign: TextAlign.start,
                           style: TextStyle(
                             fontSize: 15,
                             // fontWeight: FontWeight.w600,
                             // color: Color(0XFF666680),
                               color: AppColors.grey30.withOpacity(.3)
                           ),),
                       ),
                     ),
                     // TextWidgetInterBold(
                     //     title:
                     //     'Use 8 or more characters with a mix of letters, \nnumbers & symbols to be secure.',
                     //     color: AppColors.grey30.withOpacity(.3)),
                     const SizedBox(
                       height: 12,
                     ),
                     Align(
                       alignment: Alignment.centerLeft,
                       child: Row(
            
                         children: [
                             Checkbox(
                               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                               visualDensity: VisualDensity(horizontal: -1, vertical: -1),
                               checkColor:  Color(0XFF666680),
                               side: BorderSide(style: BorderStyle.solid,width: 3, color: Color(0XFF353542).withOpacity(.5)),
                               value: val, onChanged: (value) => setState(() {
                               val = !val;
                             } ),),
                           SizedBox(width: 25,),
                           RichText(
                               text: TextSpan(children: [
                                 TextSpan(
                                     text: 'By proceeding, you agree to our ',
                                     style:
                                     TextStyle(fontSize: 15 ,color: AppColors.grey30.withOpacity(.3))),
                                 const TextSpan(
                                     text: 'Privacy \nPolicy',
                                     style: TextStyle(color: Color(0XFF758AFF),
                                     fontSize: 15,
                                     decoration: TextDecoration.underline,
                                     decorationColor: AppColors.lightBlue,)),
                                 TextSpan(
                                     text: ' and ',
                                     style:
                                     TextStyle(color: AppColors.grey30.withOpacity(.3), fontSize: 13)),
                                 const TextSpan(
                                     text: 'Term of Use',
                                     style: TextStyle(color: Color(0XFF758AFF),
                                       fontSize: 15,
                                       decoration: TextDecoration.underline,
                                       decorationColor: AppColors.lightBlue,)),
                               ]))
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => BnavBar()));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: MySize.size34, bottom: MySize.size15),
                    child:Container(
                        height: MySize.scaleFactorHeight * 48,
                        width: MySize.scaleFactorWidth * 333,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size40),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 25,
                            color: Color(0XFF4F63BE).withOpacity(.5)
                          )
                        ],
                        color: Color(0XFF758AFF),
                      ),
                      child: Center(
                        child: Text('Get started!',
                            style: TextStyle(color:Colors.white, fontSize: 16),
                        ),
                      )),
            
            
            
                    // const FieldContainer(
                    //   containerColor: Color(0XFF758AFF),
                    //   mytitle: 'Get Started!',
                    //   textColor: AppColors.white100,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 12, bottom: 12),
                  child:   Text(
                    'Do you have already an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MySize.size20),
                    child: FieldContainer(
                      // containerColor: AppColors.grey30.withOpacity(.3),
                      containerColor:  Provider.of<ThemeChanger>(context)
                          .themeData == darkMode
                          ?  AppColors.grey30.withOpacity(.15)
                          :  AppColors.grey30.withOpacity(.15),
            
                      mytitle: 'Sign In',
                      textColor: AppColors.white100.withOpacity(.8),
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ));
  }
}
