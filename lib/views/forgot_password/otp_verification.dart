import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/views/forgot_password/update_password.dart';

import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import 'base/countNotifier.dart';

class OTPVerification extends StatefulWidget {
  String otp;
   OTPVerification({required this.otp,super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;

  @override
  void initState() {
    super.initState();
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() =>
        Provider.of<CounterNotifier>(context, listen: false).StartTimer());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              const Text(
                'Check Email',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins_Regular'),
              ),
              const SizedBox(height: 15),
              const Text(
                'Check your email we have sent you the \nrecovery code.',
                style: TextStyle(
                  color: Color(0XFFF0F4F7),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins_Regular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (value) {
                  return value == widget.otp ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(height: 35),
              RichText(
                  text: const TextSpan(
                    text: 'Didn\'t get a code?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(
                        text: ' Resend',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),


            ],
          ),
        ),
      ),
      floatingActionButton:                   SizedBox(
        height: MySize.scaleFactorHeight * 48,
        width: double.infinity,
        child: Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
          return GestureDetector(
            onTap: () {
              forgotPasswordProvider.verifyOtp(context: context, otp: widget.otp);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 45),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(.5)),
                      left: BorderSide(color: Colors.white.withOpacity(.5)),
                      bottom: BorderSide.none),
                  color: const Color(0XFF758AFF),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 8),
                        blurRadius: 25,
                        color: const Color(0XFF4F63BE).withOpacity(.5))
                  ]),
              child:  Center(
                child: forgotPasswordProvider.isVerifyOtp == true ? const CircularProgressIndicator(): const Text(
                  'Verify OTP',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        },),
      ),
    );
  }
}
