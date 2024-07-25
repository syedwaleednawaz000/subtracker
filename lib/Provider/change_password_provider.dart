import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';

class ChangePasswordProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isChangePassword = false;
  void _loginLoading({required bool load}){
    isChangePassword = load;
    notifyListeners();
  }
  Future<void> changePassword({required BuildContext context,required String  currentPassword ,required String newPassword,required String newPasswordConfirmation})async{
    var body = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation
    };
    _loginLoading(load: true);
    print("this is the body ${body}");
    try{
      Response response = await _apiService.changePassword(params: body);
      if(response.statusCode == 200){
        _loginLoading(load: false);
        FlutterToast.toastMessage(message: "Successfully password updated",);
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

}