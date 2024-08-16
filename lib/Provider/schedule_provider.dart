import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class ScheduleProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  Map<String , dynamic> scheduleData = {};
  bool isLoading = false;
  Future<void> getScheduleData({required String date}) async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getScheduleData(date: date,);
      if (response.statusCode == 200) {
        scheduleData = response.data;
        // scheduleModelData.add(ScheduleModel.fromJson(data));
        log("Fetched scheduleModelData: ${scheduleData['data']['providers'].length} ::");
      }
    } catch (error) {
      log("Error fetching scheduleModelData: $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}