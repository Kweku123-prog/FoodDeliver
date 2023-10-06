import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future <Response>getUserInfo()async{
  return  apiClient.getData(AppConstants.USER_INFO);
  }
}