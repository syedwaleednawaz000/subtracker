
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';

import '../../bottom_nav/bottom_navBar.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import 'base/button_container.dart';
import 'base/custom_textField.dart';
import 'otp_verification.dart';


class ForgetPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
   ForgetPassword({super.key});
  String? emailValidation(String? value) {
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
    return null;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xff073b5c),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Forgot Password?',
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
                const Text('Forgot Your Password? Don’t Worry we have\nyour back',
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
                const Padding(
                  padding: EdgeInsets.only(left: 50),
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
                const SizedBox(height: 4,),
                Padding(
                  padding: const EdgeInsets.only(left: 37, right: 38),
                  child: Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                    return TextFormField(
                      controller:  forgotPasswordProvider.emailTextEditingController,
                      validator: emailValidation,
                      style: const TextStyle(
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
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Color(0XFF353542))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Color(0XFF353542))
                          )
                      ),
                    );
                  },),
                ),
                SizedBox(
                  height: MySize.size5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 42, top: 7),
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

              ],
            ),
          ),
        ),
      floatingActionButton: GestureDetector(
        onTap: (){
          if(_formKey.currentState!.validate()){
            Provider.of<ForgotPasswordProvider>(context,listen: false).forgotPassword(context: context,);
          }
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
                      offset: const Offset(0, 8),
                      blurRadius: 25,
                      color: const Color(0XFF4F63BE).withOpacity(.5)
                  )
                ],
                color: const Color(0XFF758AFF),
              ),
              child:  Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                 return Center(
                   child: forgotPasswordProvider.isForgot == true ? const CircularProgressIndicator(): const Text('Send Recovery Link',
                       style: TextStyle(color:Colors.white, fontSize: 16)
                   ),
                 );
              },)),
        ),
      ),
    );
  }
}
