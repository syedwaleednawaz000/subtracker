import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/auth/login/login_screen.dart';

class LanguageProvider extends ChangeNotifier{
  LanguageProvider(){
    _loadLocale();
  }
  final ApiService _apiService = ApiService();

  bool _isLanguages = false;
  bool get isLanguages => _isLanguages;
  void _loginLoading({required bool load}){
    _isLanguages = load;
    notifyListeners();
  }
  Future<void> updateLanguage()async{
    var body = {
      'language_id': '1'
    };
    try{
      Response response = await _apiService.updateLanguages(params: body);
      if(response.statusCode == 200){
        FlutterToast.toastMessage(message: "Language successfully updated",);
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
  Map<String , dynamic> languagesData = {};
  Future<void> getLanguages()async{
    _loginLoading(load: true);
    try{
      Response response = await _apiService.getLanguages(params: {});
      if(response.statusCode == 200){
        _loginLoading(load: false);
        languagesData = response.data;
        if (kDebugMode) {
          print("hit successfully getCurrencies getLanguages $languagesData");
        }

      }else{
        _loginLoading(load: false);
        if (kDebugMode) {
          print("hit successfully in else getLanguages");
        }
      }
    }catch(error){
      _loginLoading(load: false);
      print(" getLanguages this is error ${error.toString()}");
    }
  }

  int _selectedIndex = -1;
  String _selectedLanguage = "Country";
  String _selectedTranslation = "Language";

  int get selectedIndex => _selectedIndex;
  String get selectedLanguage => _selectedLanguage;
  String get selectedTranslation => _selectedTranslation;

  void selectIndex(int index, String language, String translation) {
    _selectedIndex = index;
    _selectedLanguage = language;
    _selectedTranslation = translation;
    notifyListeners();
  }

  // local language transaltion code
  Locale? _locale;
  String languageCodeKey = 'languageCode';
  TextDirection _textDirection = TextDirection.ltr;

  Locale? get appLocale => _locale;
  TextDirection get textDirection => _textDirection;

  int _current = 0;

  int get current => _current;

  void setCurrent(int index) {
  _current = index;
  notifyListeners();
  }

  LanguageChangeController() {
  _loadLocale();
  }
  String languageCode = "";
  Future<void> _loadLocale() async {
  final preferences = await SharedPreferences.getInstance();
   languageCode = preferences.getString(languageCodeKey).toString();
  if (languageCode != null) {
  _locale = Locale(languageCode);
  _textDirection = languageCode == 'ur' ? TextDirection.rtl : TextDirection.ltr;
  _current = languageCode == 'ur' ? 1 : 0;  // Assuming 'ur' is at index 1 and 'en' is at index 0
  } else {
  _locale = const Locale('en');
  _textDirection = TextDirection.ltr;
  _current = 0;
  }
  notifyListeners();
  }

  Future<void> changeLanguage(Locale locale) async {
  // _locale = locale;
  languageCode = locale.languageCode.toString();
  _textDirection = locale.languageCode == 'ur' ? TextDirection.rtl : TextDirection.ltr;
  _current = locale.languageCode == 'ur' ? 1 : 0;  // Update current index based on the selected language
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString(languageCodeKey, locale.languageCode);
  notifyListeners();
  }

}