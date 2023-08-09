import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductsModel>_recommendedproductList=[];
  List<ProductsModel> get recommendedProductList=> _recommendedproductList;


  bool _isLoaded=false;
  bool  get isLoaded=>_isLoaded;
  Future<void>getRecommendedProductList()async{
    Response response= await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){

      print("Got Products recommended");
      _recommendedproductList=[];
      _recommendedproductList.addAll(Product.fromJson(response.body).products);
      print(_recommendedproductList);
      _isLoaded=true;
      update();

    }else{
  print("Could Not get");
    }
  }
}