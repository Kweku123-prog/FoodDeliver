import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token  ;
  final String appBaseurl;
  late SharedPreferences sharedPreferences;
  late Map<String ,String> _mainheaders;
  ApiClient({required this.appBaseurl,required this.sharedPreferences}){
    baseUrl=appBaseurl;
    timeout=Duration(seconds:20);
    token=sharedPreferences.getString(AppConstants.TOKEN)??"";
    _mainheaders={

      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };

}

Future<Response>getData(String uri,{Map<String,String>? headers}) async {
    try{
     Response response =await get(uri,
     headers: headers??_mainheaders
     );
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

