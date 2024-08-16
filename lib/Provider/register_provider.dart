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
  Future<void> register({required BuildContext context,required String  name,required String  email ,required String password})async{
    var body = {
      'name': name,
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


  String _password = '';
  int _strengthLevel = 0;
  final List<Color> _colors = [
    const Color(0XFFFF0000), // Weak (Red)
    const Color(0XFFFFA500), // Medium (Orange)
    const Color(0XFFFFFF00), // Strong (Yellow)
    const Color(0XFF00FF00), // Very Strong (Green)
  ];

  String get password => _password;
  int get strengthLevel => _strengthLevel;
  List<Color> get colors => _colors;

  void updatePassword(String value) {
    _password = value;
    _strengthLevel = _calculatePasswordStrength(_password);
    notifyListeners();
  }

  int _calculatePasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (password.contains(RegExp(r'[A-Z]'))) strength++;
    if (password.contains(RegExp(r'[0-9]'))) strength++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength++;
    return strength;
  }
}