import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularPorductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularPorductController({required this.popularProductRepo});

  List<dynamic>_popularproductList=[];
  Future<void>getPopularproductlsit()async{
    Response response= await popularProductRepo.getPopularproductlsit();
    if(response.statusCode==200){
      _popularproductList=[];
     // _popularproductList.addAll();
      update();

    }else{

    }
  }
}