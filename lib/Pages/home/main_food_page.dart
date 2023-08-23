






import 'package:flutter/material.dart';

import 'package:food_delivery/utils/dimentions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_producr_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/small_text.dart';
import 'food_page_body.dart';



class MainfoodPage extends StatefulWidget {
   MainfoodPage({Key?key}):super(key:key);

  @override
  State<MainfoodPage> createState() => _MainfoodPageState();
}

class _MainfoodPageState extends State<MainfoodPage> {


  Future<void> _loadResource() async {
    await  Get.find<PopularPorductController>().getPopularproductlsit();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    
    print("current height "+ MediaQuery.of(context).size.height.toString());
    return  RefreshIndicator(child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
            padding: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.raduis20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Ghana",color:AppColors.mainColor , size: 30,),
                    Row(
                      children: [
                        SmallText(text: "Accra ",color: Colors.black,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search,color:Colors.white , size:Dimensions.iconSize24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.raduis15),
                      color:AppColors.mainColor,

                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ]
    ),onRefresh: _loadResource);
  }
}
