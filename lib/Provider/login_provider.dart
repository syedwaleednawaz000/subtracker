import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class LoginProvider extends ChangeNotifier{
  ApiService _apiService = ApiService();

  bool isLogin = false;
  void _loginLoading({required bool load}){
    isLogin = load;
    notifyListeners();
  }

  Future<void> login()async{
    FlutterToast.toastMessage(message: "Login api call ");
    var body = {
      "email": "wedfghj",
      "password": "azxscdfvgbn"
    };
    try{
      Response response = await _apiService.login(params: body);
      if(response.statusCode == 200){
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

}