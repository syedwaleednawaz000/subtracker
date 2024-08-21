import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Provider/forgot_password_provider.dart';
import 'package:sub_tracker/Utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/utils/textStyle.dart';
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
  bool otpCorrect = false;
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
                  Padding(
                    padding:  EdgeInsets.only(bottom: MySize.scaleFactorHeight*170.0,left: MySize.size36,top: MySize.size60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(AppImages.backArrow)),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 250),
                   Text(
                     AppLocalizations.of(context)!.check_email,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins_Regular'),
                  ),
                  const SizedBox(height: 15),
                   Text(
                     AppLocalizations.of(context)!.check_your_email_we_have_sent_you_the_recovery_code,
                    style: const TextStyle(
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
                      if(value == widget.otp){
                        otpCorrect = true;
                      }else{
                        otpCorrect = false;
                      }
                      return value == widget.otp ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                  SizedBox(height: MySize.size25),
                  Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                    return Text("00 : ${forgotPasswordProvider.secondsRemaining.toString()}",style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),);
                  },),
                  SizedBox(height: MySize.size25),
                  Consumer<ForgotPasswordProvider>(builder: (context, forgotPasswordProvider, child) {
                    return
                    GestureDetector(
                      onTap: (){
                        if(forgotPasswordProvider.isTimerRunning == false){
                          forgotPasswordProvider.forgotPassword(context: context);
                        }else{
                          FlutterToast.toastMessage(message: "Please wait your task is on running",isError: true);
                        }
                      },
                      child: RichText(
                        text:  TextSpan(
                          text: AppLocalizations.of(context)!.didnt_get_a_code,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          children: const [
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
                    );
                  },)
                 , SizedBox(height: MySize.size25),
                  SizedBox(
                    height: MySize.scaleFactorHeight * 48,
                    width: double.infinity,
                    child: Consumer<ForgotPasswordProvider>(
                      builder: (context, forgotPasswordProvider, child) {
                        return GestureDetector(
                          onTap: () {
                            if (otpController.text.length >= 6) {
                              if(otpCorrect){
                                forgotPasswordProvider.verifyOtp(context: context, otp: otpController.text.trim()).then((value) {
                                  otpController.clear();
                                  forgotPasswordProvider.startTimer(timer: false);
                                });
                              }else{
                                FlutterToast.toastMessage(message: "Please enter correct otp",isError: true);
                              }
                            } else {
                              FlutterToast.toastMessage(message: "Please enter the complete OTP code. The OTP must be 6 digits long.p",isError: true);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0,right: 24),
                            child: Container(
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
                                    ? const CircularProgressIndicator(color: AppColors.white100,)
                                    :  Text(
                                  AppLocalizations.of(context)!.reset_password,
                                  style: const TextStyle(
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
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: ,
    );
  }
}
