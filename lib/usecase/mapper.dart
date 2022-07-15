import 'package:warrenapi/usecase/viewdata.dart';
import '../models/crypto_full_data_response.dart';

extension CryptoMapper on FullDataResponse {
  List<DataCryptoViewData> toViewData() {
    return data
        .map((datas) => DataCryptoViewData(
            metrics: datas.metrics,
            name: datas.name,
            slug: datas.slug,
            symbol: datas.symbol))
        .toList();
  }
}
