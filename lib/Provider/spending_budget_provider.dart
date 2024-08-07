import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class SpendingBudgetProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  Map<String , dynamic> spendingBudgetData = {};
  bool isLoading = false;
  Future<void> getSpendingBudget() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getSpendingBudget();
      if (response.statusCode == 200) {
        isLoading = false;
        spendingBudgetData = response.data;
        notifyListeners();
      }
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      print("its final ");
      notifyListeners();
    }
  }


  bool isBudgetSetLoading = false;
  Future<void> budgetSet({required String price , required String categoryID}) async {
    isBudgetSetLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.setBudget();
      if (response.statusCode == 200) {
        isBudgetSetLoading = false;
        getSpendingBudget();
        Get.back();
        FlutterToast.toastMessage(message: "Budget set Successfully");
        notifyListeners();
      }
    } catch (error) {
      isBudgetSetLoading = false;
      notifyListeners();
      log("Error fetching scheduleModelData: $error");
    } finally {
      isBudgetSetLoading = false;
      print("its final ");
      notifyListeners();
    }
  }


}