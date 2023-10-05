import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/home/food/Popular_food_detail.dart';
import 'package:food_delivery/Pages/home/main_food_page.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_producr_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimentions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child:Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_new,


                iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,


                ),

                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial())  ;
                  },
                  child: AppIcon(icon: Icons.home_outlined,


                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,


                  ),
                ),
                AppIcon(icon: Icons.shopping_cart,


                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,


                )
              ],
            ) ,
          ),
        GetBuilder<CartController>(builder:(_cartController){
          return _cartController.getItems.length>0?     Positioned(
              top:Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child:

              Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                // color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList=cartController.getItems;
                    return ListView.builder(
                        itemCount:_cartList.length,
                        itemBuilder:(_,index){
                          return Container(
                            width: double.maxFinite,
                            height:100,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    var popularIndex=Get.find<PopularPorductController>().popularProductList.indexOf(_cartList[index].product!);
                                    if(popularIndex>=0){
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex,'CartPage '));

                                    }else{
                                      var recommendedIndex=Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].product!);
                                      if(recommendedIndex<0){
                                        Get.snackbar("History Product", "Product review is nt available  for history product " ,

                                          backgroundColor: AppColors.mainColor,
                                          colorText: Colors.white,
                                        );
                                      }else{
                                        Get.toNamed(RouteHelper.getRecommendedFoo(recommendedIndex,'CartPage'));
                                      }
                                    }
                                  },
                                  child:   Container(
                                    width: Dimensions.height20*5,
                                    height: Dimensions.height20*5,
                                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                                    decoration: BoxDecoration(

                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                            )
                                        ),
                                        borderRadius: BorderRadius.circular(Dimensions.raduis20),
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10,),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height20*5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text: _cartList[index].name!,color: Colors.black54,),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: cartController.getItems[index].price.toString()!,color: Colors.black54,),
                                            Container(
                                              padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.raduis20),
                                                  color:Colors.white
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (){
                                                      cartController.addItem(_cartList[index].product!, -1);
                                                    },
                                                    child:    Icon(Icons.remove,color:AppColors.signColor),),

                                                  SizedBox(width: Dimensions.width10/2,),
                                                  BigText(text:_cartList[index].quantity.toString()), /// popularProduct.InCartItems.toString()
                                                  SizedBox(width: Dimensions.width10/2,),
                                                  GestureDetector(
                                                      onTap: (){
                                                        cartController.addItem(_cartList[index].product!, 1);
                                                      },
                                                      child: Icon(Icons.add,color: AppColors.signColor,))
                                                ],
                                              ),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );

                        });
                  }),
                ),


              )):NoDataPage(text: "Your Cart is empty ");
        })
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
          return Container(
            height: Dimensions.bottomHeighBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30, left: Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.raduis20*2),
                  topRight: Radius.circular(Dimensions.raduis20*2),
                )
            ),

            child: cartController.getItems.length>0?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.raduis20),
                      color:Colors.white
                  ),
                  child: Row(
                    children: [


                      SizedBox(width: Dimensions.width10/2,),
                      BigText(text:'Ghc  '+ cartController.totalAmount.toString()),
                      SizedBox(width: Dimensions.width10/2,),

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    if( Get.find<AuthController>().userLoggedIn()){
                      cartController.addTOHistory();
                    }
                    else{
                      Get.toNamed(RouteHelper.getSignInPage());
                    }
                    //   popularProduct.addItem(product);


                  },
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(text:  "  Check Out", color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.raduis20),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ):Container(),
          );
        },)
    );
  }
}
