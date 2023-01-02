import 'package:dio/dio.dart';

class DioConfig {
  static Dio getRequest() {
    Dio dio = Dio(BaseOptions(
      validateStatus: (int? statuscode) {
        if (statuscode != null) {
          if (statuscode >= 100 && statuscode <= 511) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    //  Time Out Exceptios  \\
    dio.options.connectTimeout=55*1000;
    dio.options.receiveTimeout=55*1000;
    dio.options.sendTimeout=55*1000; 
    return dio;
  }
}
