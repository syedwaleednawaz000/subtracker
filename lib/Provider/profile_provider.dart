import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';
import 'package:sub_tracker/views/change_password/change_password.dart';
import 'package:sub_tracker/views/currency_screen/currency_screen.dart';
import 'package:sub_tracker/views/language_selection/language_selection.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';

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
  bool hasUserChangedData() {
    // Compare the current text in the controllers with the original data
    bool isNameChanged = nameEditingController.text != (userData['data']['name'] ?? "");
    bool isEmailChanged = emailEditingController.text != (userData['data']['email'] ?? "");
    bool isPhoneNumberChanged = phoneNumberEditingController.text != (userData['data']['phone_number'] ?? "");
    return isNameChanged || isEmailChanged || isPhoneNumberChanged;
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
  List<bool> switchValues = [];
  Future<void> setSwitchValue({required Map<String , dynamic> map}) async {
    Map<String , dynamic> data = map['data'];
    switchValues.add(data['biometric_auth'] =="disabled"?false:true);
    switchValues.add(data['two_factor'] =="disabled"?false:true);
    switchValues.add(data['email_notifications'] =="disabled"?false:true);
    notifyListeners();
  }
  // List<bool> switchValues = List.generate(3, (index) => false);
  Map<String , dynamic > userData = {};
  Future<void> getProfile({required BuildContext context,required String userID, String? type})async{
    _updateLoading(load: true);
    try{
      Response response = await _apiService.getProfile();
      if(response.statusCode == 200){
        userData = response.data;
        if(type == null){
          setSwitchValue(map: userData);
        }
        if(userData['data']['currency_code'] != null){
          Provider.of<CurrencyProvider>(context,listen: false).selectCurrency(
              currencyCode: userData['data']['currency_code'], currencySymbol: userData['data']['currency_symbol']);
        }else{
          Provider.of<CurrencyProvider>(context,listen: false).selectCurrency(currencyCode:  "USD",currencySymbol: "\$");
        }
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
  Future<void> updateProfile({required BuildContext context,required String  email ,required String name , required String phone})async{
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
        updatePic= null;
        getProfile(userID: "",context: context,type: "switch");

        FlutterToast.toastMessage(message:  AppLocalizations.of(context)!.profile_updated_successfully,);
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
    prefs.remove(AppConstant.saveUserID);
    AppConstant.getUserToken = '';
    AppConstant.getUserID = '';
    // prefs.clear();
    // FlutterToast.toastMessage(message: "Successfully Logout");
    Get.offAll(()=> const WelcomeScreen());

  }


  XFile? updatePic ;
  Future<void> picPicture()async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      updatePic = image;
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



  Future<void> bioMetricAuth({required BuildContext context,})async{
    try{
      Response? response;
      if(userData['data']['biometric_auth'] =="enabled"){
        response = await _apiService.disableBiometric(params: {});
      }else{
        response = await _apiService.enableBiometric(params: {});
      }
      if(response!.statusCode == 200){
        if(userData['data']['biometric_auth'] =="enabled"){
          userData['data']['biometric_auth'] = "disable";
        }else{
          userData['data']['biometric_auth'] = "enabled";
        }
        FlutterToast.toastMessage(message: response.data['message'],);
        notifyListeners();
      }else{
      }
    }catch(error){
      print("this is error ${error.toString()}");
    }
  }

  Future<void> twoFactorAuth({required BuildContext context,})async{
    try{
      Response? response;
      if(userData['data']['two_factor'] =="enabled"){
        response = await _apiService.disableTwoFactorAuth(params: {});
      }else{
        response = await _apiService.enableTwoFactorAuth(params: {});
      }
      if(response!.statusCode == 200){
        if(userData['data']['two_factor'] =="enabled"){
          userData['data']['two_factor'] = "disable";
        }else{
          userData['data']['two_factor'] = "enabled";
        }
        FlutterToast.toastMessage(message: response.data['message'],);
        notifyListeners();
      }else{
      }
    }catch(error){
      print("this is error ${error.toString()}");
    }
  }

  Future<void> emailNotification({required BuildContext context,})async{
    try{
      Response? response;
      if(userData['data']['email_notifications'] =="enabled"){
        response = await _apiService.disableEmailNotifications(params: {});
      }else{
        response = await _apiService.enableEmailNotifications(params: {});
      }
      if(response!.statusCode == 200){
        if(userData['data']['email_notifications'] =="enabled"){
          userData['data']['email_notifications'] = "disable";
        }else{
          userData['data']['email_notifications'] = "enabled";
        }
        FlutterToast.toastMessage(message: response.data['message'],);
        notifyListeners();
      }else{
      }
    }catch(error){
      print("this is error ${error.toString()}");
    }
  }
}