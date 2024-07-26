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
  Future<void> storePlan({ required BuildContext context})async{
    _updatePlanLoading(load: true);
    var body = {
      'user_id': _selectData['user_id'],
      'type': _selectData['type'],
      'price': _selectData['price'],
      'start_date': _selectData['start_date'],
      'end_date': _selectData['end_date'],
      'is_active': _selectData['is_active']
    };
    try{
      Response response = await _apiService.storePlan(params: body);
      if(response.statusCode == 200){
        _updatePlanLoading(load: false);
        FlutterToast.toastMessage(message: response.data['message'],);
        Navigator.pop(context);
        if (kDebugMode) {
          print("hit successfully");
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
    print("this is selct data ${selectData}");
    _index = index;
    _selectData = selectData;
    notifyListeners();
  }
}
