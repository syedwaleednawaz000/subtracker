import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';

class ProfileProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  void _loginLoading({required bool load}){
    _isDeleted = load;
    notifyListeners();
  }
  bool _isUpdate = false;
  bool get isUpdated => _isUpdate;
  void _updateLoading({required bool load}){
    _isUpdate = load;
    notifyListeners();
  }
  Future<void> updateProfile({required String  email ,required String name , required String phone})async{
    _updateLoading(load: true);
    var body = {
      'name': name,
      'email': email,
      'phone_number': phone
    };
    try{
      Response response = await _apiService.updateProfile(params: body);
      if(response.statusCode == 200){
        _updateLoading(load: false);
        FlutterToast.toastMessage(message: "Profile updated successfully",);
        if (kDebugMode) {
          print("hit successfully");
        }
        Get.back();
      }else{
        _updateLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _updateLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
  Future<void> deleteAccount({required String  email ,required String password})async{
    var body = {};
    print("this is the body ${body}");
    try{
      Response response = await _apiService.deleteAccount(params: body);
      if(response.statusCode == 200){
        FlutterToast.toastMessage(message: "Account Deleted successfully",);
        if (kDebugMode) {
          print("hit successfully");
        }

      }else{
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      print("this is error ${error.toString()}");
    }
  }
  Future<void> cleanLocalData({required BuildContext context})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstant.saveUserToken);
    FlutterToast.toastMessage(message: "Successfully Logout");
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}