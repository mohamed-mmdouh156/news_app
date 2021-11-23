import 'package:dio/dio.dart' show BaseOptions, Dio, Response;

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query,).catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }
}
