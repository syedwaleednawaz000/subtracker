import 'package:flutter/material.dart';

class CurrencyProvider with ChangeNotifier {
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
