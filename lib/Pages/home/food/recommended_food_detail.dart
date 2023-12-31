
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/cart/cart_page.dart';
import 'package:food_delivery/controllers/popular_producr_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/route_helper.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimentions.dart';

class RecommendedFodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFodDetail({Key?key, required this.pageId, required this.page}):super(key:key);

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView (
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(

                    onTap:(){
                      if(page=='cartpage'){
                        Get.toNamed(RouteHelper.getcartpage());

                      }else{
                        Get.toNamed(RouteHelper.getInitial());

                      }
                    },
                    child: AppIcon(icon: Icons.clear)),

                GetBuilder<PopularPorductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){

                      if(controller.totalItems>=1)
                        Get.toNamed(RouteHelper.getcartpage())  ;
                    },

                    child: Stack(

                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularPorductController>().totalItems>=1?
                        Positioned(
                            right:0, top:0,
                            child: AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: AppColors.mainColor ,)):Container(),
                        Get.find<PopularPorductController>().totalItems>=1?
                        Positioned(
                            right:5, top:3,
                            child:  BigText(text:   Get.find<PopularPorductController>().totalItems.toString(),

                              size: 14,color: Colors.white,
                            )

                        ) :Container()


                      ],
                    ),
                  );
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(


                child: Center(child: BigText( size:Dimensions.font26,text: product.name! ,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(Dimensions.raduis20),
                    topRight:Radius.circular(Dimensions.raduis20),

                  )
                ),

              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network( AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,

              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text: product.description!
                    ,


                  ),
                    margin:EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20 )
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularPorductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,



              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },

                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,

                      icon: Icons.remove, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
                  ),

                  BigText(text: "\$ ${product.price!} " + " X "+" ${controller.InCartItems}" ,color: AppColors.mainBlackColor,size: Dimensions.font26,),
                  GestureDetector(
                    onTap: (){
                 controller.setQuantity(true);
                    },

                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,

                      icon: Icons.add, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
                  )
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeighBar,
              padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30, left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.raduis20*2),
                    topRight: Radius.circular(Dimensions.raduis20*2),
                  )
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.raduis20),
                        color:Colors.white
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,

                    ),
                  ),
                GestureDetector(
                  onTap: (){
                    controller.addItem(product);
                  },

                  child:   Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(text: "\$ ${product.price}  |Add to cart", color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.raduis20),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
