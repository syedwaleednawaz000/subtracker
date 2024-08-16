import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Basic email format validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    // Additional custom checks (optional), e.g., domain name validation
    if (!value.contains('@gmail') && !value.contains('.com')) {
      return 'Enter a Gmail address with .com domain';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      // backgroundColor: const Color(0xff073b5c),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: MySize.scaleFactorHeight*200.0,left: MySize.size36,top: MySize.size60),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Image.asset(AppImages.backArrow),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                Text(AppLocalizations.of(context)!.forgot_password,
                  style:  TextStyle(
                      color: const Color(0xFFF0F4F7),
                      fontSize: MySize.size26,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins_Regular'
                  ),
                ),
                SizedBox(
                  height: MySize.size10,
                ),
                Text(AppLocalizations.of(context)!.forgot_your_password_dont_worry_we_have_your_back,
                  style: const TextStyle(
                    color: Color(0xFFF0F4F7),
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
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.email_address,
                      style: const TextStyle(
                        color: Color(0XFF666680),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4,),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 26),
                  child: Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                    return TextFormField(
                      controller: forgotPasswordProvider.emailTextEditingController,
                      validator: emailValidation,
                      style: const TextStyle(
                          color: Color(0XFF666680)
                      ),
                      decoration: InputDecoration(
                        errorMaxLines: 3,
                          contentPadding: EdgeInsets.all(MySize.size12),
                          suffixIcon: Icon(Icons.email,
                              color: Colors.grey.withOpacity(0.5)),
                          hintText: AppLocalizations.of(context)!.email,
                          hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                              fontSize: 12,
                              fontFamily: 'Poppins_Regular',
                              fontWeight: FontWeight.w400
                          ),
                          border:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Color(0XFF353542))
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
                  }),
                ),
                SizedBox(
                  height: MySize.size5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context)!.a_link_will_be_sent_to_your_email_to_reset_your_password,
                      style: const TextStyle(
                          color: Color(0XFFF0F4F7),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins_Regular'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MySize.size25,),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<ForgotPasswordProvider>(context, listen: false).forgotPassword(context: context);
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MySize.size28),
                      height: MySize.scaleFactorHeight * 48,
                      // width: MySize.scaleFactorWidth * 333,
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
                      child: Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                        return Center(
                          child: forgotPasswordProvider.isForgot
                              ? const CircularProgressIndicator(color: AppColors.white100,)
                              :  Text(AppLocalizations.of(context)!.send_recovery_link,
                              style: const TextStyle(color: Colors.white, fontSize: 16)
                          ),
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: ,
    );
  }
}