import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/calendar_screen/Model/schedule_model.dart';

class ContactWithSupportProvider extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  bool _isSendLoading = false;
  bool get isSendLoading => _isSendLoading;
  List<dynamic> _issues = [];
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

  String _issueID = "";
  void getIssueId({required String issueID}){
    _issueID = issueID;
    notifyListeners();
  }
  Future<void> sendSupportRequest({required String subject , required String description}) async {
    _isSendLoading = true;
    notifyListeners();
    Map<String , dynamic> body={
      'issue_id': _issueID,
      'subject': subject,
      'description': description
    };
    try {
      Response response = await _apiService.sendSupportRequest(params: body);
      if (response.statusCode == 200) {
        FlutterToast.toastMessage(message: "Request send successfully");
        _isSendLoading = false;
        Get.back();
        notifyListeners();
      }
    } catch (error) {
      _isSendLoading = false;
      notifyListeners();
      log("Error fetching sendSupportRequest: $error");
    } finally {
      _isSendLoading = false;
      print("its final sendSupportRequest ");
      notifyListeners();
    }
  }


}