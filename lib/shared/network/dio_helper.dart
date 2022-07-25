
import 'package:dio/dio.dart';

class dioHelper{

  static late Dio dio;

  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }


 static Future<Response> getData({
   required String url,
   Map<String,dynamic>? query,
   String? lang='ar',
   String? auth,
 })async
 {
   dio.options.headers= {
     'lang':lang,
     'Content-Type':'application/json',
     'Authorization':auth??'',
     };
   return await dio.get(url,queryParameters:query);
 }



  static Future<Response> postData(
  {
    required String url,
    required Map<String,dynamic>? data,
    Map<String,dynamic>? query,
    String? lang='ar',
    String? auth,
  })async
  {
    dio.options.headers= {
      'lang':lang,
      'Authorization':auth??'',
      'Content-Type':'application/json',
    };
    return await dio.post(url,queryParameters: query, data:data );
  }


  static Future<Response> putData(
      {
        required String url,
        required Map<String,dynamic>? data,
        Map<String,dynamic>? query,
        String? lang='ar',
        String? auth,
      })async
  {
    dio.options.headers= {
      'lang':lang,
      'Authorization':auth??'',
      'Content-Type':'application/json',
    };
    return await dio.put(url,queryParameters: query, data:data );
  }

}