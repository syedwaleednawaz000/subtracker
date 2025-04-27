import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sub_tracker/Utils/app_colors.dart';

class FlutterToast{
  static void toastMessage({required String message , bool isError = false,}){
     Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: isError == true ? Colors.red : AppColors.purpleFF,
        textColor: Colors.white,
        fontSize: 13.0
    );
  }
}