
import 'package:food_delivery/models/products_model.dart';

import 'cart_model.dart';
import 'cart_model.dart';
class CartModel{
  int? id;
  String? name;

  int? price;

  String? img;
  int? quantity;
  bool? isExist;
  String? time ;

  ProductsModel? product;

  int? typeId;

  CartModel(
      {
        this.id,
        this.name,

        this.price,

        this.img,
        this.quantity,
        this.isExist,
        this.time,
        this.product

      }
      );


  CartModel.fromJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];

    price=json["price"];


    img= json["img"];
    quantity=json["quantity"];
    isExist=json["isExist"];
    time=json["time"];
    product=ProductsModel.fromJson(json['product']);
  }

  Map<String,dynamic>toJson()
  {
    return{
      "id":this.id,
      "name":this.name,
      "price":this.price,
      "quantity":this.quantity,
      "isExist":this.isExist,
      "img":this.img,
      "time":this.time,
      "product":this.product!.toJson()

    };
  }
}