import 'dart:developer';

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
import 'package:sub_tracker/views/change_password/change_password.dart';
import 'package:sub_tracker/views/currency_screen/currency_screen.dart';
import 'package:sub_tracker/views/language_selection/language_selection.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';

class ProfileProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController phoneNumberEditingController = TextEditingController();
  void updateTextFieldData( ){
    nameEditingController.text = userData['data']['name'] ??"";
    emailEditingController.text = userData['data']['email']??"";
    phoneNumberEditingController.text = userData['data']['phone_number'] ?? "";
    print("this is updated");
    notifyListeners();
  }
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
  Map<String , dynamic > userData = {};
  Future<void> getProfile({required String userID})async{
    _updateLoading(load: true);
    try{
      Response response = await _apiService.getProfile();
      if(response.statusCode == 200){
        userData = response.data;
        updateTextFieldData();
        _updateLoading(load: false);
        notifyListeners();
      }else{
        _updateLoading(load: false);
      }
    }catch(error){
      _updateLoading(load: false);
    }
  }
  Future<void> updateProfile({required String  email ,required String name , required String phone})async{
    _updateLoading(load: true);

    var formData = FormData.fromMap({
      'name': name,
      'email': email,
      'phone_number': phone,
    });

    // Add profile_image only if updatePic is not null
    if (updatePic != null) {
      formData.files.add(MapEntry(
        'profile_image',
        await MultipartFile.fromFile(
          updatePic!.path.toString(),
          filename: updatePic!.name.toString(),
        ),
      ));
    }

    try{
      Response response = await _apiService.updateProfile(params: formData);
      if(response.statusCode == 200){
        _updateLoading(load: false);
        getProfile(userID: "");
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
   List<Widget> screens =[];
  void getScreen(){
    screens = [
      PersonalData(),
      const LanguageSelection(),
      const CurrencySelection(),
      const ChangePassword(),
    ];
    notifyListeners();
  }

}