import 'package:dio/dio.dart';

class DataCryptoEndpoint {
  final Dio _dio;

  DataCryptoEndpoint(this._dio);

  Future<Response> getData() {
    return _dio.get('/db');
  }
}
