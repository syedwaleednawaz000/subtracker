
import 'package:dio/dio.dart';
import 'package:sub_tracker/Api_Services/api_services.dart';
import 'package:sub_tracker/utils/app_url.dart';




class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrl.login, params: params);
  }

}