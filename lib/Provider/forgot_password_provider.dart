import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class ForgotPasswordProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isRegister = false;
  void _loginLoading({required bool load}){
    isRegister = load;
    notifyListeners();
  }
  Future<void> forgotPassword({required BuildContext context,required String  email ,required String password})async{
    var body = {
      'name': 'humna',
      'email': email,
      'password': password,
      'role': 'individual',
      'password_confirmation': password
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.register(params: body);
      if(response.statusCode == 201){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully registered",);

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
  Future<void> verifyOtp({required BuildContext context,required String  email ,required String password})async{
    var body = {
      'name': 'humna',
      'email': email,
      'password': password,
      'role': 'individual',
      'password_confirmation': password
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.register(params: body);
      if(response.statusCode == 201){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully registered",);

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
  Future<void> changePassword({required BuildContext context,required String  email ,required String password,required String forgetToken})async{
    var body = {
      'password': 'password',
      'forgetToken': '\$2y\$12\$FY486rR/3VBS5rfPQ.Um5e6Kfy6ZF1yoEavEazzIKe85O4HSlXNLG',
      'email': 'enterprise@example.com'
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.changePassword(params: body);
      if(response.statusCode == 201){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully registered",);

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
}