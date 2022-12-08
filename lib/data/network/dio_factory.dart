
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_app/data/network/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Future<Dio> initDio() async {
    final Dio dio = Dio();

    Map<String, dynamic> headers = {
      //ApiConstant.contentType: ApiConstant.applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: headers,
      sendTimeout: ApiConstant.timeOut,
      receiveTimeout: ApiConstant.timeOut,
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
