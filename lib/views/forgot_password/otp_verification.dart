import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/views/forgot_password/update_password.dart';

import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import 'base/countNotifier.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

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

    Provider.of<CounterNotifier>(context, listen: false).StartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              AppImages.restPassBg,
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
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
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
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
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdatePassword()));
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
                      child: const Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 380),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
