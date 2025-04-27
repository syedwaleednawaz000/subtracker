import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/views/bottomnavbar/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class LoginProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = false;
  void _loginLoading({required bool load}){
    isLogin = load;
    notifyListeners();
  }

  Future<void> login({required BuildContext context,required String email , required String password, required bool rememberMe})async{
    var body = {
      "email": email,
      "password": password
    };
    _loginLoading(load: true);
    try{
      Response response = await _apiService.login(params: body);
      if(response.statusCode == 200){
        Map<String , dynamic> map= response.data;
        _loginLoading(load: false);
        storeLocalData(userData: map);

        if(rememberMe == true){
          storeRememberMe(email: email,password: password);
        }else{
          storeRememberMe(email: '',password: '');
        }
         // FlutterToast.toastMessage(message: "Successfully Signed In",);
        Get.offAll(()=> const BnavBar());
        // Navigator.push(context, MaterialPageRoute(builder:  (context) => BnavBar()));
        emailController.clear();
        passwordController.clear();
        notifyListeners();
      }else{
        _loginLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _loginLoading(load: false);
      log("this is error ${error.toString()}");
    }
  }


  Future<void> storeLocalData({required Map<String , dynamic> userData})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstant.saveUserToken, userData['access_token'].toString());
    prefs.setString(AppConstant.saveUserID, userData['user']['id'].toString());
    AppConstant.getUserToken = userData['access_token'].toString();
    AppConstant.getUserID = userData['user']['id'].toString();
    notifyListeners();
  }

  Future<void> storeRememberMe({required String email, required String password })async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstant.saveUserEmail, email);
    prefs.setString(AppConstant.saveUserPassword, password);
  }

  Future<void> getRememberMe()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(AppConstant.saveUserEmail) != null ){
      emailController.text = prefs.getString(AppConstant.saveUserEmail)!;
      passwordController.text= prefs.getString(AppConstant.saveUserPassword)!;
      notifyListeners();
    }else{
      emailController.clear();
      passwordController.clear();
      notifyListeners();
    }
  }
  Future<void> clearPassword()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(AppConstant.saveUserPassword) != null){
      prefs.remove(AppConstant.saveUserPassword);
      passwordController.clear();
      notifyListeners();
    }

  }



}