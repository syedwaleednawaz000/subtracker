import 'package:flutter/material.dart';

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
  fontFamily: 'Inter-Regular',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
    background: Color(0XFFF7F7FF),
    primary: Colors.white,
    secondary: Color(0XFF424252),
    tertiary: Color(0XFF4E4E61)
  )
);

ThemeData darkMode = ThemeData(
  fontFamily: 'Inter-Regular',
    brightness: Brightness.dark,
    // backgroundColor: Color(0XFFF7F7FF),
    colorScheme: ColorScheme.dark(
        background: const Color(0XFF1C1C23),
        primary: const Color(0XFF4E4E61).withOpacity(.2),
        secondary: Colors.white,
        tertiary: const Color(0XFF4E4E61)
    )
);