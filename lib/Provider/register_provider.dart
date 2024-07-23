import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class RegisterProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isRegister = false;
  void _loginLoading({required bool load}){
    isRegister = load;
    notifyListeners();
  }
  Future<void> register({required String  email ,required String password})async{
    var body = {
      'name': 'humna',
      'email': email,
      'password': password,
      'role': 'individual',
      'password_confirmation': password
    };
    print("this is the body ${body}");
    try{
      Response response = await _apiService.register(params: body);
      if(response.statusCode == 200){
        FlutterToast.toastMessage(message: "Successfully registered",);
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