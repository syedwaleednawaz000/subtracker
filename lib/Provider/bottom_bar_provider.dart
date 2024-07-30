import 'package:flutter/foundation.dart';


class BottomBarProvider with ChangeNotifier{

  int _selectedIndex = 0;
  int get selectedIndex =>  _selectedIndex;


  bool isSelected(int index) {
    return _selectedIndex == index;
  }

  void selection(int index) {
      _selectedIndex = index;
      notifyListeners();
  }

}