import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInfo{
  static Dio dio({String? accessToken}) {
    final dio = Dio();
    dio.options.headers= {
      'Authorization': "Basic $accessToken"
    };

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: true,
      // responseHeader: true,
    ));
    return dio;
  }
}