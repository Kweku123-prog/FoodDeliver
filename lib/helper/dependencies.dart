import 'package:food_delivery/controllers/popular_producr_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/cart_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{

  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
Get.lazyPut(()=>ApiClient(appBaseurl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences: Get.find()));
///repo
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
Get.lazyPut(() => CartRepo(sharePreferences :Get.find()));
Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => PopularPorductController(popularProductRepo: Get.find( )));
  Get.lazyPut(() =>AuthController(authRepo: Get.find( )));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find( )));
  Get.lazyPut(() => CartController(cartRepo: Get.find( )));
}