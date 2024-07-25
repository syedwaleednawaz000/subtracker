import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class CurrencyProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isCurrency = false;
  bool get isCurrency => _isCurrency;
  void _loginLoading({required bool load}){
    _isCurrency = load;
    notifyListeners();
  }
  Future<void> updateCurrency()async{
    var body = {
      'currency_code': 'AFN'
    };
    try{
      Response response = await _apiService.deleteAccount(params: body);
      if(response.statusCode == 200){
        FlutterToast.toastMessage(message: "Currency successfully updated",);
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
  Map<String, dynamic> currencyData = {};
  Future<void> getCurrency()async{
    _loginLoading(load: true);
    try{
      Response response = await _apiService.getCurrencies(params: {});
      if(response.statusCode == 200){
        _loginLoading(load: false);
        currencyData = response.data;

        if (kDebugMode) {
          print("hit successfully getCurrencies $currencyData");
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


  int _selectedIndex=-1;
  String _selectedCountry ='Country';
  String _selectedCurrency ='Currency';

  int get selectedIndex => _selectedIndex;
  String get selectedCountry => _selectedCountry;
  String get selectedCurrency => _selectedCurrency;

  void selectCurrency(int index, String currency, String currencyCode) {
    _selectedIndex = index;
    _selectedCountry = currency;
    _selectedCurrency = currencyCode;
    notifyListeners();
  }
}
