import 'package:dio/dio.dart';

class DioClient {
  static getDio() {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    //  dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
