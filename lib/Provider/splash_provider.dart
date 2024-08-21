import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Provider/category_provider.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/bottomnavbar/bottom_navBar.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';

class SplashProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool isRegister = false;
  void _loginLoading({required bool load}){
    isRegister = load;
    notifyListeners();
  }

  Future<void> checkLogin({required BuildContext context})async{
    // Provider.of<CategoryProvider>(context,listen: false).getAllCategory();
    Timer(const Duration(seconds: 3), () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if(prefs.getString(AppConstant.saveUserToken) != null){
          AppConstant.getUserToken = prefs.getString(AppConstant.saveUserToken).toString();
          Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const BnavBar()));
        }else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        }

    });
  }




  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;


  void initStateNetwork() {

    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    if (_connectionStatus.isNotEmpty && _connectionStatus.every((element) => element == ConnectivityResult.none)) {
      FlutterToast.toastMessage(message: "Internet is not available");
      checkLogin(context: Get.context!);
      developer.log('no internet');
    } else {
      developer.log('Connectivity changed: $_connectionStatus');
    }
    notifyListeners();
  }
}