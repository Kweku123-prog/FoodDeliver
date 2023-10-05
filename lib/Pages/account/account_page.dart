import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/dimentions.dart';

class AccountPage extends StatelessWidget {
const AccountPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",size: 24,color: Colors.white,
        ),
      ),

      body: Container (
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
                       text: "Kweku ",
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
                       text: "05449282 ",
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
                       text: "kc@gmail.com ",
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
                       Get.toNamed(RouteHelper.getInitial());
                       
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
      ),
    );
  }
}
