import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';
import 'package:sub_tracker/views/forgot_password/otp_verification.dart';
import 'package:sub_tracker/views/forgot_password/update_password.dart';

class ForgotPasswordProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String forgetToken = "";

  bool isForgot = false;
  void _loginLoading({required bool load}){
    isForgot = load;
    notifyListeners();
  }
  Future<void> forgotPassword({required BuildContext context,})async{
    var body = {
      'email': emailTextEditingController.text.trim(),
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.forgotPassword(params: body);
      if(response.statusCode == 200){
        // print("this is res ")
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "OTP send successfully ${response.data['otp'].toString()}",);
        Navigator.push(context, MaterialPageRoute(builder:  (context) => OTPVerification(otp: response.data['otp'].toString(),)));
        // Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
      }else{
        _loginLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _loginLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

  bool isVerifyOtp = false;
  void _verifyOTpLoading({required bool load}){
    isVerifyOtp = load;
    notifyListeners();
  }
  Future<void> verifyOtp({required BuildContext context,required String  otp,})async{
    var body = {
      'email': emailTextEditingController.text.trim(),
      'otp': otp,
      'type': 'Forget'
    };
    _verifyOTpLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.verifyOtp(params: body);
      if(response.statusCode == 200){
        _verifyOTpLoading(load: false);
        forgetToken = response.data['token'];
        FlutterToast.toastMessage(message: "OTP Successfully verified",);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePassword()));

      }else{
        _verifyOTpLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _verifyOTpLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

  bool isChangePass = false;
  void _ChangePassLoading({required bool load}){
    isChangePass = load;
    notifyListeners();
  }

  Future<void> changePassword({required BuildContext context,})async{
    var body = {
      'password': password.text.trim(),
      'forgetToken': forgetToken,
      'email': emailTextEditingController.text.trim()
    };
    _ChangePassLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.changePassword(params: body);
      if(response.statusCode == 200){
        _ChangePassLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully password reset",);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));

        // Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
      }else{
        _ChangePassLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _ChangePassLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
}