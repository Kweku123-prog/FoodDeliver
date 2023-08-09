import 'package:food_delivery/controllers/popular_producr_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{
Get.lazyPut(()=>ApiClient(appBaseurl: AppConstants.BASE_URL));
///repo
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => PopularPorductController(popularProductRepo: Get.find( )));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find( )));
}