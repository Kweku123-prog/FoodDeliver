import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/auth/sign_in_page.dart';
import 'package:food_delivery/Pages/auth/sign_up_page.dart';
import 'package:food_delivery/Pages/home/food/recommended_food_detail.dart';
import 'package:food_delivery/Pages/home/food_page_body.dart';
import 'package:food_delivery/Pages/home/home_page.dart';
import 'package:food_delivery/Pages/splash/splash_page.dart';
import 'package:food_delivery/controllers/popular_producr_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Pages/home/food/Popular_food_detail.dart';
import 'Pages/home/main_food_page.dart';
import 'controllers/cart_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getCartData();
    return GetBuilder<PopularPorductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
         home: HomePage(),
         initialRoute: RouteHelper.getSplashpage(),
         getPages: RouteHelper.routes,
        );
      }); 
    });
  }
}
