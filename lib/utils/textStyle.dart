import 'package:flutter/material.dart';

class CustomTextStyles {

  static TextStyle textStyleWith14WhiteBold400() {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Inter",
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }


  static TextStyle textStyleWith16WhiteBold600() {
    return const TextStyle(
      fontFamily: "Inter-Regular",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle textStyleWith12WhiteBold400() {
    return const TextStyle(
      fontFamily: "Inter-Regular",
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

// Add more styles as needed
}
