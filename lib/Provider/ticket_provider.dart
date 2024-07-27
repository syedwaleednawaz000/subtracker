import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class TicketProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isStoreTicket = false;

  bool get isStoreTicket => _isStoreTicket;

  void _storeTicketLoading({required bool load}) {
    _isStoreTicket = load;
    notifyListeners();
  }

  Future<void> storeTicket(
      {required String categoryID, required String totalBudget}) async {
    _storeTicketLoading(load: true);
    var body = {
      'issue': 'issue 1',
      'subject': 'features',
      'description': ' features',
      'ticket_id': 'tfhghj'
    };
    try {
      Response response = await _apiService.storeTickets(params: body);
      if (response.statusCode == 200) {
        _storeTicketLoading(load: false);
        FlutterToast.toastMessage(
          message: "User category added successfully",
        );
        // Get.back();
      } else {
        _storeTicketLoading(load: false);
        if (kDebugMode) {}
      }
    } catch (error) {
      _storeTicketLoading(load: false);
    }
  }

  bool _isUpdateTicket = false;

  bool get isUpdateTicket => _isUpdateTicket;

  void _updateTicketLoading({required bool load}) {
    _isUpdateTicket = load;
    notifyListeners();
  }
  Future<void> updateTickets(
      {required String ticketID,}) async {
    _updateTicketLoading(load: true);
    var body = {
      'issue': 'issue3',
      'subject': 'features updated',
      'description': 'tfyjgjhgf',
      'ticket_id': 'trfyhgjh',
      '_method': 'PUT'
    };
    try {
      Response response = await _apiService.updateTickets(ticketID: ticketID,params: body);
      if (response.statusCode == 200) {
        _updateTicketLoading(load: false);
        FlutterToast.toastMessage(
          message: "category added successfully",
        );
        // Get.back();
      } else {
        _updateTicketLoading(load: false);
        if (kDebugMode) {}
      }
    } catch (error) {
      _updateTicketLoading(load: false);
    }
  }


  bool _isDeleteTicket = false;

  bool get isDeleteTicket => _isDeleteTicket;

  void _deleteTicketLoading({required bool load}) {
    _isDeleteTicket = load;
    notifyListeners();
  }

  Future<void> deleteTicket(
      {required BuildContext context, required String ticketID}) async {
    _deleteTicketLoading(load: true);
    var body = {};
    try {
      Response response = await _apiService.deleteTicket(
          ticketID: ticketID, params: body);
      if (response.statusCode == 200) {
        _deleteTicketLoading(load: false);
        FlutterToast.toastMessage(
          message: response.data['message'],
        );
      } else {
        _deleteTicketLoading(load: false);
      }
    } catch (error) {
      _deleteTicketLoading(load: false);
    }
  }

  Map<String, dynamic> getTicketData = {};
  bool _isGetTicket = false;

  bool get isGetTicket => _isGetTicket;

  void _getTicketLoading({required bool load}) {
    _isGetTicket = load;
    notifyListeners();
  }

  Future<void> getTickets() async {
    _getTicketLoading(load: true);
    try {
      Response response = await _apiService.getTickets(params: {});
      if (response.statusCode == 200) {
        _getTicketLoading(load: false);
        getTicketData = response.data;
      } else {
        _getTicketLoading(load: false);
      }
    } catch (error) {
      _getTicketLoading(load: false);
    }
  }



  Map<String, dynamic> showTicketDat = {};
  bool _isShowTicket = false;

  bool get isShowTicket => _isShowTicket;

  void _showTicketLoading({required bool load}) {
    _isShowTicket = load;
    notifyListeners();
  }

  Future<void> showTicketDetails() async {
    _showTicketLoading(load: true);
    try {
      Response response = await _apiService.showTicketDetails(params: {});
      if (response.statusCode == 200) {
        _showTicketLoading(load: false);
        showTicketDat = response.data;
      } else {
        _showTicketLoading(load: false);
      }
    } catch (error) {
      _showTicketLoading(load: false);
    }
  }
}
