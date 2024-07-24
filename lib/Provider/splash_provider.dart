import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/bottom_nav/bottom_navBar.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/welcomeScreen/welcome_screen.dart';

class SplashProvider extends ChangeNotifier{
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


  Future<void> checkLogin({required BuildContext context})async{
    Timer(const Duration(seconds: 3), () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if(prefs.getString(AppConstant.saveUserToken) != null){
          Navigator.push(context, MaterialPageRoute(builder:  (context) => BnavBar()));
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
    if (_connectionStatus.isNotEmpty && _connectionStatus.every((element) => element == ConnectivityResult.none)) {
      FlutterToast.toastMessage(message: "Internet is not available");
      developer.log('no internet');
    } else {
      developer.log('Connectivity changed: $_connectionStatus');
    }

    notifyListeners();
  }
}