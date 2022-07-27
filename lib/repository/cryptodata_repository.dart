import '../endpoint/endpoint.dart';
import '../models/api model/crypto_full_data_response.dart';

class DataCryptoRepository {
  final DataCryptoEndpoint dataCryptoEndpoint;

  DataCryptoRepository({required this.dataCryptoEndpoint});

  Future<FullDataResponse> getData() async {
    final result = await dataCryptoEndpoint.getData();
    return FullDataResponse.fromJson(result.data);
  }
}
