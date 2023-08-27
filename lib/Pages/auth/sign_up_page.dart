import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/show_custom_message.dart';
import '../../models/signup_body_model.dart';
import '../../utils/dimentions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController =TextEditingController();
    var passwordController =TextEditingController();
    var nameController =TextEditingController();
    var phoneController =TextEditingController();
    var signUpImages=[
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController){

      String name=nameController.text.trim();
      String phone=phoneController.text.trim();
      String email=emailController.text.trim();
      String password=nameController.text.trim();

      if(name.isEmpty){

        showCustomSnackBar("Type in your name",title: "Name");

      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number",title: "Phone Number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email",title: "Email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in your a valid Email address ",title: "Valid Email address ");

      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "password");

      }
      //else if(password.length<6){
       //// showCustomSnackBar("Password can not be less than six characters",title: "Password");}

      else{
        showCustomSnackBar("All good  ",title: "Perfect");

        SignUpBody signUpBody =SignUpBody(name:name,
        phone:phone,
          email:email,
          password:password
        );
        authController.registration(signUpBody).then((status){
           if(status.isSuccess){

             print("Success Registration");


           }
           else{
             showCustomSnackBar(status.message);
           }
        }) ;
      }

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){

        return !_authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.05,),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor:Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(
                        'assets/image/logo part 1.png'
                    ),
                  ),
                ),
              ),
              AppTextField(textController: emailController, hinttext: "Email", icon: Icons.email),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: passwordController, hinttext: "Password", icon: Icons.password),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: nameController, hinttext: "Name", icon: Icons.person),
              SizedBox(height: Dimensions.height20,),
              AppTextField(textController: phoneController, hinttext: "Phone", icon: Icons.phone),
              SizedBox(height: Dimensions.height20+Dimensions.height20),
              GestureDetector(
                onTap: (){
                  _registration(_authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.raduis30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign Up",
                      size: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              RichText(text: TextSpan(
                  recognizer: TapGestureRecognizer() ..onTap=()=>Get.back(),
                  text: "Have an account already",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20
                  )
              ),
              ),

              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(text: TextSpan(

                  text: "Sign Up using one of the following methods ",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16
                  )
              ),
              ),

              Wrap(
                children:
                List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.raduis30,
                    backgroundImage: AssetImage(
                        "assets/image/"+signUpImages[index]
                    ),
                  ),
                ))
                ,
              )


            ],
          ),
        ):CustomLoader();
      })
    ); 


  }
}
