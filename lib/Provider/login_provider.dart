import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class LoginProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isLogin = false;
  void _loginLoading({required bool load}){
    isLogin = load;
    notifyListeners();
  }

  Future<void> login({required String email , required String password, required bool rememberMe})async{

    var body = {
      "email": email,
      "password": password
    };
    try{
      Response response = await _apiService.login(params: body);
      if(response.statusCode == 200){
        FlutterToast.toastMessage(message: "Successfully login",);
        if(rememberMe == true){
          storeRememberMe(email: email,password: password);
        }
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


  Future<void> storeLocalData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
  Future<void> getLocalData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
  Future<void> cleanLocalData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
  Future<void> storeRememberMe({required String email, required String password })async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("", email);
    prefs.setString("", password);
  }
  Future<void> getRememberMe()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('');
    prefs.getString('');
  }

}