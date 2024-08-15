import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class PlanProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
//Todo about store the api data
  bool _isUpdatePlan = false;
  bool get isUpdatePlan => _isUpdatePlan;
  void _updatePlanLoading({required bool load}){
    _isUpdatePlan = load;
    notifyListeners();
  }
  Future<void> subscribePlan({ required BuildContext context})async{
    print("hit successfully in mange ${_selectData}");
    _updatePlanLoading(load: true);
    var body = {
      'plan_id': _selectData['id'],
    };
    try{
      Response response = await _apiService.subscribePlane(params: body);
      if(response.statusCode == 200){
        _updatePlanLoading(load: false);
        FlutterToast.toastMessage(message: "Plan subscribe successfully",);
        Navigator.pop(context);
        if (kDebugMode) {
          print("hit successfully in mange");
        }

      }else{
        _updatePlanLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _updatePlanLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
//Todo about get plane data
  List<Map<String, dynamic> > planData = [];
  bool _isPlan = false;
  bool get isPlan => _isPlan;
  void _planLoading({required bool load}){
    _isPlan = load;
    notifyListeners();
  }
  Future<void> getPlanes()async{
    _planLoading(load: true);
    try{
      Response response = await _apiService.getPlanes(params: {});
      if(response.statusCode == 200){
        _planLoading(load: false);
        planData = (response.data as List).map((item) => item as Map<String, dynamic>).toList();

        if (kDebugMode) {
          print("hit successfully getPlanes $planData");
        }

      }else{
        _planLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _planLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }
//Todo about set index
  Map<String , dynamic> _selectData = {};
  int _index = -1;
  int get selectIndex => _index;
  void updateIndex ({required int index ,required Map<String , dynamic> selectData}){
    _index = index;
    _selectData = selectData;
    notifyListeners();
  }




  //Patch plan
  bool _isCancel = false;
  bool get isCancel => _isCancel;
  void _cancelLoading({required bool load}){
    _isCancel = load;
    notifyListeners();
  }
  Future<void> cancelPlan({ required BuildContext context, required String planID})async{
    _cancelLoading(load: true);
    try{
      Response response = await _apiService.cancelPlan();
      if(response.statusCode == 200){
        _cancelLoading(load: false);
        userPlan();
        FlutterToast.toastMessage(message: response.data['message'],);
        Navigator.pop(context);
        if (kDebugMode) {
          print("hit successfully");
        }

      }else{
        _cancelLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _cancelLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }


  Map<String, dynamic> activeSubscriptionData = {};
  bool _isActiveSubscription = false;
  bool get isActiveSubscription => _isActiveSubscription;
  void _activeSubscriptionLoading({required bool load}){
    _isActiveSubscription = load;
    notifyListeners();
  }
  Future<void> userPlan()async{
    _activeSubscriptionLoading(load: true);
    try{
      Response response = await _apiService.userPlan(params: {});
      if(response.statusCode == 200){
        _activeSubscriptionLoading(load: false);
        activeSubscriptionData = response.data;
        if (kDebugMode) {
          print("hit successfully activeSubscriptionData $activeSubscriptionData");
        }

      }else{
        _activeSubscriptionLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _activeSubscriptionLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }


}
