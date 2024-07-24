import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


  @override
  void initState() {
    Provider.of<CounterNotifier>(context, listen: false).StartTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.restPassBg), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250,),
            Text('Check Email',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins_Regular'
              ),
            ),
                const SizedBox(height: 15,),
          Text('Check your email we have sent you the \nrecovery code.',
            style: TextStyle(
                color: Color(0XFFF0F4F7),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins_Regular',
            ),
            textAlign:  TextAlign.center,
          ),
                const SizedBox(height: 50,),
                //   Pinput(
                //   showCursor: true,
                //   closeKeyboardWhenCompleted: true,
                //   validator: (s) {
                //     return s == '2222' ? null : 'Pin is incorrect';
                //   },
                //   defaultPinTheme: PinTheme(
                //       width: 25, height: 1,
                //       margin: EdgeInsets.only(right: 15),
                //       decoration: BoxDecoration(
                //     color: Colors.white,
                //   )),
                // ),
                Consumer<CounterNotifier>(builder: (context, val, child){
                  return InkWell(
                    onTap: () {
                      Provider.of<CounterNotifier>(context, listen: false).StartTimer();
                    },
                    child: Text('00 : ${val.count.toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  );
                }),
                SizedBox(height: 35,),
                RichText(text: const TextSpan(
                    text: 'Didn\'t get a code?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: ' Resend',
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,
                        ),)
                    ]

                )),
                SizedBox(height: 35,),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePassword()));
                  },
                  child: Container(
                    height: 50, width: 295,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      // border: Border.all(color: Colors.white.withOpacity(.5)),
                        border: Border(
                            top: BorderSide(color: Colors.white.withOpacity(.5)),
                            left: BorderSide(color: Colors.white.withOpacity(.5)),
                            // right: BorderSide(color: Colors.white.withOpacity(.5)),
                            bottom: BorderSide.none
                        ),
                      color: Color(0XFF758AFF), 
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 25,
                            color: Color(0XFF4F63BE).withOpacity(.5)
                        )

                      ]
                    ),
                    child: Center(
                        child: Text('Reset Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, fontWeight: FontWeight.w500
                          ),

                    )),
                  ),
                ),

                const SizedBox(height: 380,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


