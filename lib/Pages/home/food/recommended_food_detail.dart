
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimentions.dart';

class RecommendedFodDetail extends StatelessWidget {
  const RecommendedFodDetail({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView (
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(


                child: Center(child: BigText( size:Dimensions.font26,text: "Chineese side",)),
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
              background: Image.asset("assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,

              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child: ExpandableTextWidget(text: "This is an e-commerce To some, snaffling a cold cut of ham from the fridge is one of the high points of the festive season. Once glazed and studded with decorative cloves, you have a real feast on your hands. And the best bit is that it just keeps on giving – even a small ham joint app forThis is an e-commerce app for food delivery using flutter with backend as crash course tutorial for iOS and Android. food delivery using flutter with backend as crash course tutorial for iOS and Android. This is a shopping app with backend of Laravel and Laravel admin panel using restful api complete CRUD operations. We also used firebase for notification. This tutorial covers complete shopping cart, placing orders, signup or registration, sign-in or login, paym"
                    ,


                  ),
                    margin:EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20 )
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  iconSize: Dimensions.iconSize24,

                  icon: Icons.remove, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
                
                BigText(text: "\$12.88 " + " X "+" 0" ,color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                  iconSize: Dimensions.iconSize24,

                  icon: Icons.add, backgroundColor: AppColors.mainColor,iconColor: Colors.white,),
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
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  child: BigText(text: "\$10 |Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.raduis20),
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
