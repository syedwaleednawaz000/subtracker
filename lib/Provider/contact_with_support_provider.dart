import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class ContactWithSupportProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  // List<ScheduleModel> scheduleModelData = [];
  Map<String , dynamic> issuesType = {};
  bool isLoading = false;
  Future<void> getTicketIssuesTypes() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getTicketIssuesTypes();
      if (response.statusCode == 200) {
        isLoading = false;
        issuesType = response.data;
        notifyListeners();
      }
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log("Error fetching getTicketIssuesTypes: $error");
    } finally {
      print("its final ");
      notifyListeners();
    }
  }


}