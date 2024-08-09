import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import 'base/countNotifier.dart';

class OTPVerification extends StatefulWidget {
  String otp;
  OTPVerification({required this.otp, super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;

  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<CounterNotifier>(context, listen: false).StartTimer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the pin themes with the correct context
    defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
        ),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
        ),
      ),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
        ),
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
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
                    enabled: true,
                    controller: otpController,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: MySize.scaleFactorHeight * 48,
        width: double.infinity,
        child: Consumer<ForgotPasswordProvider>(
          builder: (context, forgotPasswordProvider, child) {
            return GestureDetector(
              onTap: () {
                if (otpController.text.length >= 6) {
                  forgotPasswordProvider.verifyOtp(context: context, otp: otpController.text.trim());
                } else {
                  FlutterToast.toastMessage(message: "Please enter correct otp");
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
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
                  child: Center(
                    child: forgotPasswordProvider.isVerifyOtp
                        ? const CircularProgressIndicator()
                        : const Text(
                      'Verify OTP',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
