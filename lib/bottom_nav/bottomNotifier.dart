import 'package:flutter/foundation.dart';


class BottomNotifier with ChangeNotifier{
/// initializer
  int _selectedIndex = 0;
  // bool _selectedColor = false;
  // selectedColor ? Color(0XFF758AFF): Color(0XFFC1C1CD)
/// Getter method
int get selectedIndex =>  _selectedIndex;
   // bool get selectedColor => _selectedColor;


  bool isSelected(int index) {
    return _selectedIndex == index;
  }

  void selection(int index) {
      _selectedIndex = index;
      // _selectedColor = false;
      notifyListeners();
  }

}