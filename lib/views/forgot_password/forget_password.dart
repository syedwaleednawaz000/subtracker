// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tresorly/base/text_widget.dart';
// import 'package:tresorly/views/forgot_password/otp_verification.dart';
//
// import '../../utils/app_colors/app_colors.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(image: AssetImage('assets/background/images/bg.png'),
//                 fit: BoxFit.cover,colorFilter: ColorFilter.mode(AppColors.bgColor, BlendMode.color)
//             )
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 60, right: 60),
//           child: SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 250,),
//                 TextWidgetInterMedium(title: 'Forgot Password?', fontSize: 26, color: Colors.white),
//                 SizedBox(height: 15,),
//                 TextWidgetInterRegular(title: 'Forgot Your Password? Don’t Worry we \nhave your back',
//                   fontSize: 12, color: AppColors.greyF7,
//                   fontWeight: FontWeight.w400, align: TextAlign.center,
//                 ),
//                 SizedBox(height: 25,),
//                 TextFormField(
//                   decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.mail, color: AppColors.greyF7.withOpacity(.5), size: 18,),
//                       hintText: 'Email',
//                       fillColor: AppColors.whiteColor.withOpacity(.1),
//                       filled: true,
//                       hintStyle: TextStyle(color: AppColors.greyF7.withOpacity(.5), fontSize: 14,
//                           fontWeight: FontWeight.w400),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(color: Color(0XFFF0F4F7)),
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 7,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 3),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: TextWidgetInterRegular(title: 'A link will be sent to your email to reset \nyour password',
//                       fontSize: 12, color: AppColors.greyF7,
//                       fontWeight: FontWeight.w400, align: TextAlign.start,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 35,),
//                 GestureDetector(
//                   onTap:(){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerification()));
//                   },
//                   child: Container(
//                     height: 50, width: 295,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(7),
//                       color: AppColors.blueBC, /*Secondary Color*/
//                     ),
//                     child: Center(child: TextWidgetInterRegular(title: 'Send Recovery Link', fontSize: 16, color: AppColors.whiteColor, fontWeight: FontWeight.w500)),
//                   ),
//                 ),
//                 const SizedBox(height: 380,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



/// 2nd time


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottom_nav/bottom_navBar.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import 'base/button_container.dart';
import 'base/custom_textField.dart';
import 'otp_verification.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff073b5c),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text('Forgot Password?',
                style: TextStyle(
                  color: Color(0XFFF0F4F7),
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins_Regular'
                ),
                ),

              SizedBox(
                height: MySize.size10,
              ),
              Text('Forgot Your Password? Don’t Worry we have\nyour back',
                style: TextStyle(
                    color: Color(0XFFF0F4F7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins_Regular',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MySize.size25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('E-mail address',
                    style: TextStyle(
                        color: Color(0XFF666680),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'Poppins_Regular'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4,),
              // SizedBox(
              //     width: MySize.scaleFactorWidth * 300,
              //     height: MySize.scaleFactorHeight * 50,
              //     child: const CustomTextField(
              //       hintText: 'Email',
              //       icon: Icons.email_rounded,
              //     )
              // ),




          Padding(
            padding: const EdgeInsets.only(left: 37, right: 38),
            child: TextFormField(
              style: TextStyle(
                  color:  Color(0XFF666680)
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(MySize.size12),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon((Icons.email),
                      color: Colors.grey.withOpacity(0.5)),
                ),
                hintText: 'Email',
                hintStyle:
                TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 12,fontFamily: 'Poppins_Regular', fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0XFF353542))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0XFF353542))
                )
              ),
            ),
          ),
              SizedBox(
                height: MySize.size5,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 42, top: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('A link will be sent to your email to reset your\n password',
                    style: TextStyle(
                        color: Color(0XFFF0F4F7),
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins_Regular'
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size25,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => OTPVerification()));
                },
                child: Padding(
                  padding:
                  EdgeInsets.only(top: MySize.size28, ),
                  child: Container(
                      height: MySize.scaleFactorHeight * 48,
                      width: MySize.scaleFactorWidth * 333,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size40),
                        // border: Border.all(color: Colors.white.withOpacity(.5)),
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
                        child: Text('Send Recovery Link',
                          style: TextStyle(color:Colors.white, fontSize: 16)
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
