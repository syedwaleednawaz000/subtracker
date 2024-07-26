import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class CurrencyProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isUpdateCurrency = false;
  bool get isUpdateCurrency => _isUpdateCurrency;
  void _UpdateCurrencyLoading({required bool load}){
    _isUpdateCurrency = load;
    notifyListeners();
  }
  Future<void> updateCurrency({required String currencyCode,required BuildContext context})async{
    _UpdateCurrencyLoading(load: true);
    var body = {
      'currency_code': currencyCode
    };
    try{
      Response response = await _apiService.updateCurrencies(params: body);
      if(response.statusCode == 200){
        _UpdateCurrencyLoading(load: false);
        FlutterToast.toastMessage(message: response.data['message'],);
        Navigator.pop(context);
        if (kDebugMode) {
          print("hit successfully");
        }

      }else{
        _UpdateCurrencyLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else ");
        }
      }
    }catch(error){
      _UpdateCurrencyLoading(load: false);
      print("this is error ${error.toString()}");
    }
  }

  Map<String, dynamic> currencyData = {};
  bool _isCurrency = false;
  bool get isCurrency => _isCurrency;
  void _loginLoading({required bool load}){
    _isCurrency = load;
    notifyListeners();
  }
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

  void selectCurrency({required int index, required String currency, required String currencyCode}) {
    _selectedIndex = index;
    _selectedCountry = currency;
    _selectedCurrency = currencyCode;
    notifyListeners();
  }
}
