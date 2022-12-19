import 'package:dio/dio.dart';
import 'package:server_api/shared/network/end_points.dart';
import 'package:server_api/shared/network/local/cache_helper.dart';

class DioHelper {
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.168.100/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    // dio!.options.headers =
    // {
    //   'lang':lang,
    //   'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    // dio!.options.headers =
    // {
    //   'lang':lang,
    //   'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    // dio!.options.headers =
    // {
    //   'lang':lang,
    //   'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
