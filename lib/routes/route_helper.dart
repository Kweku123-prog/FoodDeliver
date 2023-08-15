import 'package:food_delivery/Pages/cart/cart_page.dart';
import 'package:food_delivery/Pages/home/food/recommended_food_detail.dart';
import 'package:food_delivery/Pages/home/main_food_page.dart';
import 'package:food_delivery/Pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/home/food/Popular_food_detail.dart';
import '../Pages/home/home_page.dart';

class RouteHelper{

  static const String splashPage='/splash-page';
  static const String  initial='/';
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static const  String cartPage="/cart-page";
  static String getPopularFood( int pageid,String page)=>'$popularFood?pageId=$pageid&page=$page';
  static String getRecommendedFoo( int pageid,String page)=>'$recommendedFood?pageId=$pageid&page=$page';
  static String getInitial()=>'$initial';
  static getcartpage()=>'$cartPage';

  static String getSplashpage()=>'$splashPage';
  
  static List<GetPage>routes=[
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),


    GetPage(name: popularFood, page: (){

      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!),page:page!);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters['page'];
      return RecommendedFodDetail(pageId: int.parse(pageId!),page:page!);
    },
        transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page: (){

      return CartPage();
    },
        transition: Transition.fadeIn
    ),
  ];
}