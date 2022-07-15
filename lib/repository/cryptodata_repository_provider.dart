import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/repository/cryptodata_repository.dart';
import '../endpoint/endpoint_provider.dart';

final dataCryptoRepositoryProvider = Provider((ref) {
  return DataCryptoRepository(
      dataCryptoEndpoint: ref.read(dataCryptoEndpoinProvider));
});
