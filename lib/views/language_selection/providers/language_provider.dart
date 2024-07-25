import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageProvider with ChangeNotifier {
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
}
