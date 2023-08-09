import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/products_model.dart';

class PopularPorductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularPorductController({required this.popularProductRepo});

  List<ProductsModel>_popularproductList=[];
  List<ProductsModel> get popularProductList=> _popularproductList;


  bool _isLoaded=false;
  bool  get isLoaded=>_isLoaded;
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
}