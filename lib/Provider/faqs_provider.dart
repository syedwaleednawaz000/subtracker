import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class FaqsProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();


  Map<String, dynamic> faqsData = {};
  bool _isFaqs = false;
  bool get isFaqs => _isFaqs;
  void _loginLoading({required bool load}){
    _isFaqs = load;
    notifyListeners();
  }
  Future<void> getFaqs()async{
      _loginLoading(load: true);
    try{
      Response response = await _apiService.getFaqs(params: {});
      if(response.statusCode == 200){
        _loginLoading(load: false);
        faqsData = response.data;
        if (kDebugMode) {
          print("hit successfully getCurrencies $faqsData");
        }

      }else{
        _loginLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _loginLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

}
