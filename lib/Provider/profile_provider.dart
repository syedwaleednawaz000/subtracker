import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

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
  bool _isUpdateProfile = false;
  bool get isUpdated => _isUpdateProfile;
  void _updateLoading({required bool load}){
    _isUpdateProfile = load;
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

  bool _isDeleteAccount = false;
  bool get isDeleteAccount => _isDeleteAccount;
  void _deleteAccountLoading({required bool load}){
    _isDeleteAccount = load;
    notifyListeners();
  }
  Future<void> deleteAccount({required BuildContext context})async{
    _deleteAccountLoading(load: true);
    var body = {};
    print("this is the body ${body}");
    try{
      Response response = await _apiService.deleteAccount(params: body);
      if(response.statusCode == 200){
        _deleteAccountLoading(load: false);
        FlutterToast.toastMessage(message: response.data['message'],);
        cleanLocalData(context: context);
        if (kDebugMode) {
          print("hit successfully");
        }

      }else{
        _deleteAccountLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _deleteAccountLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
  Future<void> cleanLocalData({required BuildContext context})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstant.saveUserToken);
    FlutterToast.toastMessage(message: "Successfully Logout");
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }


  XFile? updatePic ;
  Future<void> picPicture()async{
    final ImagePicker picker = ImagePicker();
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if(_image != null){
      updatePic = _image;
      notifyListeners();
    }

  }
}