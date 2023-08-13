import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';

class PopularPorductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularPorductController({required this.popularProductRepo});
  late CartController _cart;

  List<ProductsModel>_popularproductList=[];
  List<ProductsModel> get popularProductList=> _popularproductList;
 int get quantity{
   return _quantity;
 }

  bool _isLoaded=false;
  bool  get isLoaded=>_isLoaded;
  int _quantity=0;

  int _inCartItems=0;
  int get InCartItems=>_inCartItems+_quantity;
  Future<void>getPopularproductlsit()async{
    Response response= await popularProductRepo.getPopularproductlsit();
    if(response.statusCode==200){

      print("Got Products");
      _popularproductList=[];
      _popularproductList.addAll(Product.fromJson(response.body).products);
      print(_popularproductList);
      _isLoaded=true;
      update();

    }else{

    }
  }


  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity=checkQuantity(_quantity+1);

    }else{
      _quantity=checkQuantity(_quantity-1);

    }
    update();
  }
 int  checkQuantity(int quantity){

    if((_inCartItems+quantity)<0){
      Get.snackbar("Item Count", "You can't reduce more" ,

      backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
       if(_inCartItems>0){
         _quantity=-_inCartItems;
         return _quantity;
       }
      return 0;
    }else if((_inCartItems+quantity) >20){

      Get.snackbar("Item Count", "You can't add more" ,

        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }

void initProduct(ProductsModel product ,CartController cart){

    _quantity=0;
    _inCartItems=0;
    _cart=cart;
    var exist=false;
    exist=_cart.existIncart(product);
    //If exist
    //get from storage _inCartItems=3
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    print("the qunatity in the cart is " + _inCartItems.toString());

}

void addItem(ProductsModel product,){

    _cart.addItem(product, _quantity);
    _quantity=0;
    _inCartItems=_cart.getQuantity(product);

  update();

}
int get totalItems{
    return _cart.totalItems;
}


List<CartModel> get getItems{
    return _cart.getItems;
}
}