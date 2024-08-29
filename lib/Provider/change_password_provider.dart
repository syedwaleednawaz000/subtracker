import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChangePasswordProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isChangePassword = false;
  void _loginLoading({required bool load}){
    isChangePassword = load;
    notifyListeners();
  }
  Future<void> updatePassword({required BuildContext context,required String  currentPassword ,required String newPassword,required String newPasswordConfirmation})async{
    var body = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.updatePassword(params: body);
      if(response.statusCode == 200){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.password_updated_successfully,);
        Get.back();
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

  void updatePasswordStepper(String value) {
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