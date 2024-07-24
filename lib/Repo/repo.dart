
import 'package:dio/dio.dart';
import 'package:sub_tracker/Api_Services/api_services.dart';
import 'package:sub_tracker/utils/app_url.dart';




class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrl.login, params: params);
  }
  Future<Response> register({var params}) {
    return apiClient.post(url: AppUrl.register, params: params);
  }
  Future<Response> deleteAccount({var params}) {
    return apiClient.delete(url: AppUrl.deleteAccount, params: params);
  }
}