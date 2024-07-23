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
  bool isSelected2 = false;

  final _formKey = GlobalKey<FormState>();


// Custom email validator function
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Basic email format validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    // Additional custom checks (optional), e.g., domain name validation
    if (!value.contains('@gmail') || !value.contains('.com')) {
      return 'Enter a Gmail address with .com domain';
    }
    return null; // Return null if validation succeeds
  }

// Custom password validator function
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Validate password complexity (e.g., length and character types)
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Additional custom checks (optional), e.g., character types
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, lowercase letter, number, and special character';
    }
    return null; // Return null if validation succeeds
  }
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: const Color(0XFF1C1C23),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.bg3Image), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 28, bottom: 165, left: 115, right: 115),
                  ),
                  const Text( 'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 24,
                        color: Colors.white
                    ),),
                 Padding(
                   padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
                   child: Column(
                     children: [
                       CustomTextFormField(
                         text: 'E-mail address',
                         hintText: 'Email',
                         validator: validateEmail,
                         suffixIcons: IconButton(onPressed: (){},
                             icon:  Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       CustomTextFormField(
                         text: 'Password',
                         hintText: 'Password',
                         validator:  validatePassword,
                         obscureText: isSelected1 ,
                         suffixIcons: IconButton(
                             onPressed: (){
                               isSelected1 = !isSelected1;

                             setState(() {
                                   });
                                 }, icon: isSelected1
                                     ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                                     : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       CustomTextFormField(
                         text: 'Confirm Password',
                         hintText: 'Confirm Password',
                          obscureText: isSelected2,
                          validator: validatePassword,
                         suffixIcons: IconButton(onPressed: (){
                           setState(() {
                             isSelected2 = !isSelected2;
                           });
                         }, icon: isSelected2
                             ? Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3))
                             : Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       // Column(
                       //   crossAxisAlignment: CrossAxisAlignment.start,
                       //   mainAxisAlignment: MainAxisAlignment.start,
                       //   children: [
                       //     const Text('Password',
                       //       textAlign: TextAlign.center,
                       //       style: TextStyle(
                       //         fontSize: 14,
                       //         fontWeight: FontWeight.w400,
                       //         color: Color(0XFF666680)
                       //       ),),
                       //     const SizedBox(
                       //       height: 4,
                       //     ),
                       //     TextFormField(
                       //       style: const TextStyle(
                       //           color:  Color(0XFF666680)
                       //       ),
                       //     obscureText: isSelected,
                       //       decoration: InputDecoration(
                       //           isDense: true,
                       //           contentPadding: const EdgeInsets.only(left: 20, right: 20),
                       //           hintText: 'Passwod',
                       //           hintStyle:  TextStyle(
                       //             fontFamily: 'Poppins_Regular',
                       //             fontSize: 14,
                       //             fontWeight: FontWeight.w400,
                       //             color: const Color(0XFF666680).withOpacity(.3),
                       //           ),
                       //           suffixIcon: IconButton(onPressed: (){
                       //             setState(() {
                       //               isSelected = !isSelected;
                       //             });
                       //           }, icon: isSelected
                       //               ? Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)
                       //               : Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3),)),
                       //           border: OutlineInputBorder(
                       //               borderRadius: BorderRadius.circular(16),
                       //               borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                       //               focusedBorder: OutlineInputBorder(
                       //           borderRadius: BorderRadius.circular(16),
                       //         borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                       //       ),
                       //       enabledBorder: OutlineInputBorder(
                       //         borderRadius: BorderRadius.circular(16),
                       //         borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                       //
                       //           )
                       //       ),
                       //
                       //     ),
                       //   ],
                       // ),
                       const SizedBox(
                         height: 10,
                       ),
                   //     Column(
                   //       crossAxisAlignment: CrossAxisAlignment.start,
                   //       mainAxisAlignment: MainAxisAlignment.start,
                   //       children: [
                   //         const Text('Confirm Password',
                   //           textAlign: TextAlign.center,
                   //           style: TextStyle(
                   //             fontSize: 14,
                   //             fontWeight: FontWeight.w400,
                   //             color: Color(0XFF666680)
                   //           ),),
                   //         const SizedBox(
                   //           height: 4,
                   //         ),
                   //         TextFormField(
                   //           style: const TextStyle(
                   //               color:  Color(0XFF666680)
                   //           ),
                   //           obscureText: isSelected1,
                   //           decoration: InputDecoration(
                   //             contentPadding: const EdgeInsets.only(left: 20, right: 20),
                   //               isDense: true,
                   //               hintText: 'Confirm Password',
                   //               hintStyle:  TextStyle(
                   //                 fontFamily: 'Poppins_Regular',
                   //                 fontSize: 14,
                   //                 fontWeight: FontWeight.w400,
                   //                 color: const Color(0XFF666680).withOpacity(.3),
                   //               ),
                   //               suffixIcon: IconButton(onPressed: (){
                   //                 setState(() {
                   //                   isSelected1 = !isSelected1;
                   //                 });
                   //               }, icon: isSelected1
                   //                   ? Icon(Icons.lock, color: const Color(0XFF666680).withOpacity(.3),)
                   //                   : Icon(Icons.lock_open, color: const Color(0XFF666680).withOpacity(.3),)),
                   //               border: OutlineInputBorder(
                   //                   borderRadius: BorderRadius.circular(16),
                   //                   borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
                   //               focusedBorder: OutlineInputBorder(
                   //           borderRadius: BorderRadius.circular(16),
                   //           borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                   //         ),
                   // enabledBorder: OutlineInputBorder(
                   //   borderRadius: BorderRadius.circular(16),
                   //   borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
                   // ),
                   //           ),
                   //
                   //         ),
                   //       ],
                   //     ),

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
                                 visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                                 checkColor:  const Color(0XFF666680),
                                 side: BorderSide(style: BorderStyle.solid,width: 3, color: const Color(0XFF353542).withOpacity(.5)),
                                 value: val, onChanged: (value) => setState(() {
                                 val = !val;
                               } ),),
                             const SizedBox(width: 25,),
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
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => const BnavBar()));
                      }
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
                              offset: const Offset(0, 8),
                              blurRadius: 25,
                              color: const Color(0XFF4F63BE).withOpacity(.5)
                            )
                          ],
                          color: const Color(0XFF758AFF),
                        ),
                        child: const Center(
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
                  const Padding(
                    padding: EdgeInsets.only(
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
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
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
          ),
        ));
  }
}

  class CustomTextFormField extends StatelessWidget {
    const CustomTextFormField({
      super.key,
      required this.hintText,
      required this.text,
      this.suffixIcons,
      this.prefixIcons,
      required this.validator,
      this.obscureText,
    });

    final String hintText;
    final String text;
    final IconButton? suffixIcons;
    final Icon? prefixIcons;
    final FormFieldValidator<String> validator;
    final bool? obscureText ;

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFF666680),
            ),),
         // color: Color(0XFF666680),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            obscureText: obscureText ?? false,
            validator: validator,
            style: const TextStyle(
                 color:  Color(0XFF666680)
            ),
            decoration: InputDecoration(
               isDense: true,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: hintText,
                hintStyle:  TextStyle(
                  fontFamily: 'Poppins_Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF666680).withOpacity(.3),
                ),
                // hintStyle: TextStyle(color: Color(0XFF666680)),
                // suffixIcon: Icon(Icons.email, color: const Color(0XFF666680).withOpacity(.3),),
                suffixIcon: suffixIcons,
                prefixIcon: prefixIcons,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: const Color(0XFF4E4E61).withOpacity(.2)),
              ),
            ),
          ),
        ],
      );
    }
  }
