// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
//
// class ThemeChanger with ChangeNotifier {
//
//
//   var _themeMode = ThemeMode.light;
//   ThemeMode get themeMode => _themeMode;
//
//
//
//   void setTheme(themeMode){
//     _themeMode = themeMode;
//     notifyListeners();
//   }
//
//   void toggleTheme() {
//     if (_themeMode == ThemeMode.light) {
//       setTheme(ThemeMode.dark);
//     } else {
//       setTheme(ThemeMode.light);
//     }
//   }
//
// }


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//
// var _themeMode = ThemeMode.light;
// ThemeMode get themeMode => _themeMode;
//
// bool get isDarkMode => _themeMode == ThemeMode.dark;
//
// void setTheme(ThemeMode themeMode) {
//   _themeMode = themeMode;
//   notifyListeners();
// }
//
// void toggleTheme() {
//   if (_themeMode == ThemeMode.light) {
//     setTheme(ThemeMode.dark);
//   } else {
//     setTheme(ThemeMode.light);
//   }
// }
class ThemeChanger with ChangeNotifier {

  ThemeData _themeData = lightMode;
  ThemeData  get  themeData => _themeData;

 set themeData(ThemeData themeData) {
  _themeData = themeData;
  notifyListeners();
}

void toggleTheme() {
  if (_themeData == lightMode) {
   themeData = darkMode;
  } else {
    themeData = lightMode;
  }
}

}





ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  // backgroundColor: Color(0XFF1C1C23),
  colorScheme: ColorScheme.light(
    background: Color(0XFFF7F7FF),
    primary: Colors.white,
    secondary: Color(0XFF424252),
    tertiary: Color(0XFF4E4E61)
  )
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    // backgroundColor: Color(0XFFF7F7FF),
    colorScheme: ColorScheme.dark(
        background: Color(0XFF1C1C23),
        primary: Color(0XFF4E4E61).withOpacity(.2),
        secondary: Colors.white,
        tertiary: Color(0XFF4E4E61)
    )
);