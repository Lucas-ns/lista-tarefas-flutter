import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  CustomDio() {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['X-Parse-Application-Id'] =
        dotenv.get('APPLICATION_ID');
    _dio.options.headers['X-Parse-REST-API-Key'] = dotenv.get('API_KEY');
    _dio.options.baseUrl = dotenv.get("BASE_URL");
  }
}
