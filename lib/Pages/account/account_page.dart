import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/dimentions.dart';

class AccountPage extends StatelessWidget {
const AccountPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn=Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      print("user has login");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",size: 24,color: Colors.white,
        ),
      ),

      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?(userController.isLoading?Container (
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(
            children: [

              //Profile Icons
              AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height45+Dimensions.height30,
                size: Dimensions.height15*10 ,
              ),
              SizedBox(height: Dimensions.height30,),
              //Name
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AccountWidget(appIcon: AppIcon(icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5 ,
                      ) ,
                          bigText: BigText(
                            text: userController.userModel.name,
                          )
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //phone
                      AccountWidget(appIcon: AppIcon(icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5 ,
                      ) ,
                          bigText: BigText(
                            text: userController.userModel.phone,
                          )
                      ),
                      SizedBox(height: Dimensions.height20,),
                      //Email
                      AccountWidget(appIcon: AppIcon(icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5 ,
                      ) ,
                          bigText: BigText(
                            text: userController.userModel.email,
                          )
                      ),   SizedBox(height: Dimensions.height20,),
                      AccountWidget(appIcon: AppIcon(icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5 ,
                      ) ,
                          bigText: BigText(
                            text: "Fill in you address ",
                          )
                      ),   SizedBox(height: Dimensions.height20,),

                      //message
                      AccountWidget(appIcon: AppIcon(icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10*5/2,
                        size: Dimensions.height10*5 ,
                      ) ,
                          bigText: BigText(
                            text: "Message ",
                          )
                      ),
                      SizedBox(height: Dimensions.height20,),

                      //message
                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear;
                            Get.find<CartController>().clearCartHistroy();
                            Get.offNamed(RouteHelper.getInitial());


                          }
                          else{
                            print("You logged out ");
                          }


                        },
                        child: AccountWidget(appIcon: AppIcon(icon: Icons.logout_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5 ,
                        ) ,
                            bigText: BigText(
                              text: "Logout",
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ):CustomLoader()):Container(child: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.height20*8,
              margin: EdgeInsets.only(left: Dimensions.width20 ,right:Dimensions.width20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/signintocontinue.png"
                  )
                )
              ),
            ),
            GestureDetector(
              onTap: (){

                Get.toNamed(RouteHelper.signIn);
              },
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height20*5,
                margin: EdgeInsets.only(left: Dimensions.width20 ,right:Dimensions.width20 ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.raduis20),

                ),
                child: Center(child: BigText(text: "Sign in ",color: Colors.white,size: Dimensions.font20,)),
              ),
            ),

          ],
        )),);
      },),
    );
  }
}
