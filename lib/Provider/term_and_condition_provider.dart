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

class TermAndConditionProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();

  Map<String, dynamic> termAndConditionData = {};
  bool _isTermAndCondition = false;
  bool get isTermAndCondition => _isTermAndCondition;
  void _termAndConditionLoading({required bool load}){
    _isTermAndCondition = load;
    notifyListeners();
  }
  Future<void> getTermAndCondition()async{
    if(termAndConditionData == null){
      _termAndConditionLoading(load: true);
    }

    try{
      Response response = await _apiService.getTermAndCondition(params: {});
      if(response.statusCode == 200){
        _termAndConditionLoading(load: false);
        termAndConditionData = response.data;
      }else{
        _termAndConditionLoading(load: false);
      }
    }catch(error){
      _termAndConditionLoading(load: false);
    }
  }
}