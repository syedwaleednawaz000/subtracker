import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';

class RegisterProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isRegister = false;
  void _loginLoading({required bool load}){
    isRegister = load;
    notifyListeners();
  }
  Future<void> register({required BuildContext context,required String  email ,required String password})async{
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
      if(response.statusCode == 200){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully registered",);

        Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
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