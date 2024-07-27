import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sub_tracker/Repo/repo.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';

class CategoryProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isStoreUserCat = false;

  bool get isStoreUserCat => _isStoreUserCat;

  void _storeUserCatLoading({required bool load}) {
    _isStoreUserCat = load;
    notifyListeners();
  }

  Future<void> storeUserCategories(
      {required String categoryID, required String totalBudget}) async {
    _storeUserCatLoading(load: true);
    var body = {'category_id': categoryID, 'total_budget': totalBudget};
    try {
      Response response = await _apiService.storeUserCategories(params: body);
      if (response.statusCode == 200) {
        _storeUserCatLoading(load: false);
        FlutterToast.toastMessage(
          message: "User category added successfully",
        );
        // Get.back();
      } else {
        _storeUserCatLoading(load: false);
        if (kDebugMode) {}
      }
    } catch (error) {
      _storeUserCatLoading(load: false);
    }
  }

  Future<void> addCategories(
      {required String categoryName,}) async {
    _storeUserCatLoading(load: true);
    var body = { 'name': categoryName};
    try {
      Response response = await _apiService.addCategories(params: body);
      if (response.statusCode == 200) {
        _storeUserCatLoading(load: false);
        FlutterToast.toastMessage(
          message: "category added successfully",
        );
        // Get.back();
      } else {
        _storeUserCatLoading(load: false);
        if (kDebugMode) {}
      }
    } catch (error) {
      _storeUserCatLoading(load: false);
    }
  }

  Future<void> updateCategory(
      {required String categoryName,}) async {
    _storeUserCatLoading(load: true);
    var body = { 'name': categoryName, 'image':'image','_method': 'PUT'};
    try {
      Response response = await _apiService.updateCategory(params: body);
      if (response.statusCode == 200) {
        _storeUserCatLoading(load: false);
        FlutterToast.toastMessage(
          message: "category added successfully",
        );
        // Get.back();
      } else {
        _storeUserCatLoading(load: false);
        if (kDebugMode) {}
      }
    } catch (error) {
      _storeUserCatLoading(load: false);
    }
  }

  bool _isDeleteCategory = false;

  bool get isDeleteCategory => _isDeleteCategory;

  void _deleteCategoryLoading({required bool load}) {
    _isDeleteCategory = load;
    notifyListeners();
  }

  Future<void> deleteCategory(
      {required BuildContext context, required String categoryID}) async {
    _deleteCategoryLoading(load: true);
    var body = {};
    try {
      Response response = await _apiService.deleteCategory(
          categoryID: categoryID, params: body);
      if (response.statusCode == 200) {
        _deleteCategoryLoading(load: false);
        FlutterToast.toastMessage(
          message: response.data['message'],
        );
      } else {
        _deleteCategoryLoading(load: false);
      }
    } catch (error) {
      _deleteCategoryLoading(load: false);
    }
  }

  Map<String, dynamic> categoriesData = {};
  bool _isCategories = false;

  bool get isCategories => _isCategories;

  void _categoryLoading({required bool load}) {
    _isCategories = load;
    notifyListeners();
  }

  Future<void> getCategories() async {
    _categoryLoading(load: true);
    try {
      Response response = await _apiService.getCategories(params: {});
      if (response.statusCode == 200) {
        _categoryLoading(load: false);
        categoriesData = response.data;
      } else {
        _categoryLoading(load: false);
      }
    } catch (error) {
      _categoryLoading(load: false);
    }
  }



  Map<String, dynamic> totalBudgetData = {};
  bool _isTotalBudget = false;

  bool get isTotalBudget => _isTotalBudget;

  void _totalBudgetLoading({required bool load}) {
    _isTotalBudget = load;
    notifyListeners();
  }

  Future<void> geTotalBudgets() async {
    _totalBudgetLoading(load: true);
    try {
      Response response = await _apiService.geTotalBudgets(params: {});
      if (response.statusCode == 200) {
        _totalBudgetLoading(load: false);
        categoriesData = response.data;
      } else {
        _totalBudgetLoading(load: false);
      }
    } catch (error) {
      _totalBudgetLoading(load: false);
    }
  }
}
