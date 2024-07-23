import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sub_tracker/Repo/repo.dart';

class RegisterProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isRegister = false;
  void _loginLoading({required bool load}){
    isRegister = load;
    notifyListeners();
  }
  Future<void> login()async{
    var body = {
      'name': 'humna',
      'email': 'humna@gmail.com',
      'password': 'humna123',
      'role': 'individual',
      'password_confirmation': 'humna123'
    };
    try{
      Response response = await _apiService.register(params: body);
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