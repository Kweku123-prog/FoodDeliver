import 'package:food_delivery/controllers/popular_producr_controller.dart';
import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init()async{
Get.lazyPut(()=>ApiClient(appBaseurl: "https://www.dbtech.com"));
///repo
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
//controllers
  Get.lazyPut(() => PopularPorductController(popularProductRepo: Get.find()));
}