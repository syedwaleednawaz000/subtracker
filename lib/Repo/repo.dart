import 'package:dio/dio.dart';
import 'package:sub_tracker/Api_Services/api_services.dart';
import 'package:sub_tracker/utils/app_url.dart';

class ApiService {
  final APIClient apiClient = APIClient();

  //Todo here all post method
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrl.login, params: params);
  }

  Future<Response> register({var params}) {
    return apiClient.post(url: AppUrl.register, params: params);
  }
  Future<Response> forgotPassword({var params}) {
    return apiClient.post(url: AppUrl.forgotPassword, params: params);
  }
  Future<Response> verifyOtp({var params}) {
    return apiClient.post(url: AppUrl.verifyOtp, params: params);
  }
  Future<Response> changePassword({var params}) {
    return apiClient.post(url: AppUrl.changePassword, params: params);
  }
  Future<Response> enableTwoFactorAuth({var params}) {
    return apiClient.post(url: AppUrl.enableTwoFactorAuth, params: params);
  }

  Future<Response> disableTwoFactorAuth({var params}) {
    return apiClient.post(url: AppUrl.disableTwoFactorAuth, params: params);
  }

  Future<Response> enableBiometric({var params}) {
    return apiClient.post(url: AppUrl.enableBiometric, params: params);
  }

  Future<Response> disableBiometric({var params}) {
    return apiClient.post(url: AppUrl.disableBiometric, params: params);
  }

  Future<Response> enableEmailNotifications({var params}) {
    return apiClient.post(url: AppUrl.enableEmailNotifications, params: params);
  }

  Future<Response> disableEmailNotifications({var params}) {
    return apiClient.post(
        url: AppUrl.disableEmailNotifications, params: params);
  }

  Future<Response> storeTickets({var params}) {
    return apiClient.post(url: AppUrl.storeTickets, params: params);
  }

  Future<Response> updateLanguages({var params}) {
    return apiClient.post(url: AppUrl.updateLanguages, params: params);
  }

  Future<Response> updateCurrencies({var params}) {
    return apiClient.post(url: AppUrl.updateCurrencies, params: params);
  }

  Future<Response> updateCategory({var params}) {
    return apiClient.post(url: AppUrl.updateCategories, params: params);
  }
  Future<Response> storePlan({var params}) {
    return apiClient.post(url: AppUrl.storePlan, params: params);
  }


  Future<Response> updateProfile({var params}) {
    return apiClient.post(url: AppUrl.updateProfile, params: params);
  }

  Future<Response> updatePassword({var params}) {
    return apiClient.post(url: AppUrl.updatePassword, params: params);
  }

  Future<Response> updateTickets({required String ticketID,var params}) {
    return apiClient.post(url: AppUrl.updateTickets+ticketID, params: params);
  }

  Future<Response> storeUserCategories({var params}) {
    return apiClient.post(url: AppUrl.storeUserCategories, params: params);
  }

  Future<Response> addCategories({var params}) {
    return apiClient.post(url: AppUrl.addCategories, params: params);
  }

  Future<Response> storeSubscriptions({var params}) {
    return apiClient.post(url: AppUrl.subscriptions, params: params);
  }

  Future<Response> sendSupportRequest({var params}) {
    return apiClient.post(url: AppUrl.sendSupportRequest, params: params);
  }

  //Todo here all get method
  Future<Response> getLanguages({var params}) {
    return apiClient.get(
      url: AppUrl.getLanguages,
    );
  }

  Future<Response> getAllCategory({var params}) {
    return apiClient.get(
      url: AppUrl.getAllCategory,
    );
  }

  Future<Response> getTickets({var params}) {
    return apiClient.get(
      url: AppUrl.getTickets,
    );
  }

  Future<Response> getNotifications({var params}) {
    return apiClient.get(
      url: AppUrl.getNotifications,
    );
  }

  Future<Response> geTotalBudgets({var params}) {
    return apiClient.get(
      url: AppUrl.geTotalBudgets,
    );
  }

  Future<Response> getCurrencies({var params}) {
    return apiClient.get(
      url: AppUrl.getCurrencies,
    );
  }
  Future<Response> getFaqs({var params}) {
    return apiClient.get(
      url: AppUrl.getFaqs,
    );
  }
  Future<Response> getPlanes({var params}) {
    return apiClient.get(
      url: AppUrl.getPlans,
    );
  }

  Future<Response> getQrCode({var params}) {
    return apiClient.get(
      url: AppUrl.getTowTwoFactorQrCode,
    );
  }

  Future<Response> showTicketDetails({var params}) {
    return apiClient.get(
      url: AppUrl.showTicketDetails,
    );
  }

  Future<Response> getSubscriptions({var params}) {
    return apiClient.get(
      url: AppUrl.getSubscriptions,
    );
  }
  Future<Response> getScheduleData({required String date}) {
    return apiClient.get(
      url: AppUrl.getScheduleData+date,
    );
  }
  Future<Response> getSpendingBudget() {
    return apiClient.get(
      url: AppUrl.getSpendingBudget,
    );
  }
  Future<Response> getTicketIssuesTypes() {
    return apiClient.get(
      url: AppUrl.getTicketIssuesTypes,
    );
  }
  Future<Response> activeSubscriptions({var params}) {
    return apiClient.get(
      url: AppUrl.activeSubscriptions,
    );
  }
  Future<Response> getTermAndCondition({var params}) {
    return apiClient.get(
      url: AppUrl.termsAndConditions,
    );
  }
  Future<Response> privacyAndPolicy({var params}) {
    return apiClient.get(
      url: AppUrl.privacyAndPolicy,
    );
  }
  Future<Response> getProfile() {
    return apiClient.get(
      url: AppUrl.getProfile,
    );
  }
  //Todo here all delete method
  Future<Response> deleteAccount({var params}) {
    return apiClient.delete(url: AppUrl.deleteAccount, params: params);
  }

  Future<Response> deleteTicket({required String ticketID,var params}) {
    return apiClient.delete(url: AppUrl.deleteTicket, params: params);
  }

  Future<Response> deleteSubscriptions({required String subscriptionID,var params}) {
    return apiClient.delete(url: AppUrl.deleteSubscriptions+subscriptionID, params: params);
  }

  Future<Response> deleteCategory({required String categoryID,var params}) {
    return apiClient.delete(url: AppUrl.deleteCategories+categoryID, params: params);
  }
//Todo here all patch
  Future<Response> cancelPlan({required String planID,var params}) {
    return apiClient.patch(url: "${AppUrl.plansCancel}$planID/cancel", params: params);
  }
}
