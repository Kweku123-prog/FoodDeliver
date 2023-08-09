import 'package:food_delivery/Pages/home/main_food_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Pages/home/food/Popular_food_detail.dart';

class RouteHelper{
  static const String  initial='/';
  static const String popularFood="/popular-food";
  static String getPopularFood()=>'$popularFood';
  
  
  static List<GetPage>routes=[
    GetPage(name: "/", page: ()=>MainfoodPage()),
    GetPage(name: popularFood, page: (){
      print("Popular Get called");
      return PopularFoodDetail();
    }),
    
  ];
}