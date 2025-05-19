import 'package:dio/dio.dart';
import 'package:flutter_movie/core/network/interceptors/curl_logger_interceptor.dart';

class DioClient {
  final String baseUrl;
  final Dio _dio;

  DioClient({required this.baseUrl}) : _dio = Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.interceptors.addAll([
      CurlLoggerInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    ]);
  }

  Dio get dio => _dio;
}
