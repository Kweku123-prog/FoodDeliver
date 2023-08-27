import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

import '../utils/dimentions.dart';
class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hinttext;
  final IconData icon;
  const AppTextField({Key? key, required this.textController, required this.hinttext, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.height20,right: Dimensions.height20 ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.raduis30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,10),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          //hint text
          hintText: hinttext,
          prefixIcon: Icon(icon,color: AppColors.yellowColor,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.raduis20),
            borderSide: BorderSide(
                width: 1.0,
                color: Colors.white
            ),
            //Enabled border

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.raduis20),
            borderSide: BorderSide(
                width: 1.0,
                color: Colors.white
            ),
            //Enabled border

          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.raduis20),

            //Enabled border

          ),
        ),
      ),
    );
  }
}
