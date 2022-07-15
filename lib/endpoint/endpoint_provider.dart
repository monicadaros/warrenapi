import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/endpoint/endpoint.dart';

final dataCryptoEndpoinProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://my-json-server.typicode.com/willianWarren',
  ));

  return DataCryptoEndpoint(dio);
});
