
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Provider/schedule_provider.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';

import '../views/subscriptioninfo/subscription_info.dart';

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

  Future<void> addNewSubscription({
    required String description,
    required String startDate,
    required String renewalDate,
    required String billingCycle,
    required String price,
    required String reminderDuration,
    required String categoryID,
    required String providerId,
    XFile? image,
    FilePickerResult? document,
  }) async {
    _storeSubLoading(load: true);
    String cleanedPrice = price.replaceAll(RegExp(r'[^\d.]'), '');

    FormData formData = FormData.fromMap({
      'category_id': categoryID,
      'provider_id': providerId,
      'description': description,
      'start_date': startDate,
      'renewal_date': renewalDate,
      'billing_cycle': billingCycle,
      'reminder': reminderDuration,
      'price': cleanedPrice,
      // 'color_code':'AD7BFF'
    });

    if (image != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(image.path.toString(), filename: image.path.split('/').last),
      ));
    }
    if (document != null) {
      formData.files.add(MapEntry(
        'document',
        await MultipartFile.fromFile(document.files[0].path.toString(), filename: document.files[0].path.toString().split('/').last),
      ));
    }

    try {
      Response response = await _apiService.addNewSubscription(params: formData);
      if (response.statusCode == 200) {
        getSubscriptions();
        _storeSubLoading(load: false);
        FlutterToast.toastMessage(message:'Subscription added successfully');
        Get.back();

        if (kDebugMode) {
          print("hit successfully");
        }
      } else {
        _storeSubLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    } catch (error) {
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
        final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
        Provider.of<ScheduleProvider>(context,listen: false).getScheduleData(date: dateFormat.format(DateTime.now()));
        getSubscriptions();
        Get.back();
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
        subscriptionData = {};
        subscriptionData = response.data;
        if (kDebugMode) {
          log("hit successfully getSubscriptions ${subscriptionData['data']['subscriptions'].length} ===");
          log("hit successfully getSubscriptions ${subscriptionData['data']['upcommingbills'].length} ===");
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