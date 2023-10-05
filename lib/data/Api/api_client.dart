import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token  ;
  final String appBaseurl;
  late Map<String ,String> _mainheaders;
  ApiClient({required this.appBaseurl}){
    baseUrl=appBaseurl;
    timeout=Duration(seconds:20);
    token=AppConstants.TOKEN;
    _mainheaders={

      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };

}

Future<Response>getData(String uri) async {
    try{
     Response response =await get(uri);
     return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString() );
    }
}

void updateHeadrerer(String token ){
  _mainheaders={

    'Content-type':'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
    "HttpHeaders.contentTypeHeader": "application/json"
  };
}

Future <Response> postData(String uri,dynamic body) async {
    print(body.toString());
    try{
    Response response= await  post(uri, body,headers: _mainheaders);
    print(response.toString());
    return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
} 
}

