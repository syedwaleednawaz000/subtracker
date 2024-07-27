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

class SubscriptionProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;
  void _loginLoading({required bool load}){
    _isDeleted = load;
    notifyListeners();
  }
  bool _isStoreSub = false;
  bool get isStoreSub => _isStoreSub;
  void _storeSubLoading({required bool load}){
    _isStoreSub = load;
    notifyListeners();
  }
  Future<void> storeSubscription({required String  description ,required String startDate ,
    required String renewalDate, required String billingCycle, required String userId,
    required String price, required String reminderDuration, required String categoryID,
    required String providerId})async{
    _storeSubLoading(load: true);
    var body = {
      'description': 'Ab voluptatum quis q',
      'start_date': '2010-11-10',
      'renewal_date': '2017-08-24',
      'billing_cycle': 'Yearly',
      'price': '65.0',
      'reminder_duration': '1 week',
      'category_id': '2',
      'user_id': '2',
      'provider_id': '1'
    };
    try{
      Response response = await _apiService.storeSubscriptions(params: body);
      if(response.statusCode == 200){
        _storeSubLoading(load: false);
        FlutterToast.toastMessage(message: "Subscription added successfully",);
        if (kDebugMode) {
          print("hit successfully");
        }
        // Get.back();
      }else{
        _storeSubLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _storeSubLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

  bool _isDeleteSubscription = false;
  bool get isDeleteSubscription => _isDeleteSubscription;
  void _deleteSubscriptionLoading({required bool load}){
    _isDeleteSubscription = load;
    notifyListeners();
  }
  Future<void> deleteSubscription({required BuildContext context,required String subscriptionID})async{
    _deleteSubscriptionLoading(load: true);
    var body = {};
    print("this is the body ${body}");
    try{
      Response response = await _apiService.deleteSubscriptions(subscriptionID: subscriptionID,params: body);
      if(response.statusCode == 200){
        _deleteSubscriptionLoading(load: false);
        FlutterToast.toastMessage(message: response.data['message'],);
        if (kDebugMode) {
          print("hit successfully");
        }

      }else{
        _deleteSubscriptionLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _deleteSubscriptionLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }


  Map<String, dynamic> subscriptionData = {};
  bool _isSubscription = false;
  bool get isSubscription => _isSubscription;
  void _subscriptionLoading({required bool load}){
    _isSubscription = load;
    notifyListeners();
  }
  Future<void> getSubscriptions()async{
    _subscriptionLoading(load: true);
    try{
      Response response = await _apiService.getSubscriptions(params: {});
      if(response.statusCode == 200){
        _subscriptionLoading(load: false);
        subscriptionData = response.data;
        if (kDebugMode) {
          print("hit successfully getSubscriptions $subscriptionData");
        }

      }else{
        _subscriptionLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _subscriptionLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
}