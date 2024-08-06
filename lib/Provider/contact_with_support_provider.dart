import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class ContactWithSupportProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  List<dynamic> _issues = [];

  bool get isLoading => _isLoading;
  List<dynamic> get issues => _issues;
  Future<void> getTicketIssuesTypes() async {
    _isLoading = true;
    notifyListeners();
    try {
      Response response = await _apiService.getTicketIssuesTypes();
      if (response.statusCode == 200) {
        _isLoading = false;
        final data = response.data;
        _issues = data['data'];
        notifyListeners();
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      log("Error fetching getTicketIssuesTypes: $error");
    } finally {
      _isLoading = false;
      print("its final ");
      notifyListeners();
    }
  }


}