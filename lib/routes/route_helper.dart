import 'package:food_delivery/Pages/home/food/recommended_food_detail.dart';
import 'package:food_delivery/Pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Pages/home/food/Popular_food_detail.dart';

class RouteHelper{
  static const String  initial='/';
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static String getPopularFood( int pageid)=>'$popularFood?pageId=$pageid';
  static String getRecommendedFoo( int pageid)=>'$recommendedFood?pageId=$pageid';
  static String getInitial()=>'$initial';
  
  static List<GetPage>routes=[
    GetPage(name: initial, page: ()=>MainfoodPage()),
    GetPage(name: popularFood, page: (){
      var pageId=Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId=Get.parameters['pageId'];
      return RecommendedFodDetail(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn
    ),
    
  ];
}