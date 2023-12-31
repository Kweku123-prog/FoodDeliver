

import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences
});
  
 Future<Response> registration(SignUpBody signUpBody) async {
   return apiClient.postData(AppConstants.REGISTRATION_URI,signUpBody.toJson());
  }
  Future<Response> login(String email,String password) async {
    return apiClient.postData(AppConstants.LOGIN_URI,{"email":email,"password":password});
  }
 Future<bool> saveUserToken(String token)async{
   apiClient.token=token;
   apiClient.updateHeadrerer(token);
   return await sharedPreferences.setString(AppConstants.TOKEN, token);


  }


bool userLoggedIn(){
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }


  Future<String> getUserToken()async{
   return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }
  Future<void>saveUserNumberAndPassword(String number,String password)async {
   try{
     await sharedPreferences.setString(AppConstants.PHONE, number);
     await sharedPreferences.setString(AppConstants.PASSWORD, password);
   }catch(e){
     throw e;
   }
  }

  bool clearSharedData(){
   sharedPreferences.remove(AppConstants.TOKEN);
   sharedPreferences.remove(AppConstants.PASSWORD);
   sharedPreferences.remove(AppConstants.PHONE);
   apiClient.token='';
   apiClient.updateHeadrerer("");
   return true;
  }

}