import 'package:food_delivery/data/Api/api_client.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularproductlsit()async{

    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);

  }
  void addItem(ProductsModel product){

  }
}