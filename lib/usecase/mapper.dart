import 'package:warrenapi/usecase/viewdata.dart';
import '../models/api model/crypto_full_data_response.dart';
import 'viewdata_chart.dart';

extension CryptoMapper on FullDataResponse {
  List<DataCryptoViewData> toViewData() {
    return data
        .map((datas) => DataCryptoViewData(
              metrics: datas.metrics,
              name: datas.name,
              slug: datas.slug,
              symbol: datas.symbol,
            ))
        .toList();
  }
}

extension DataChartsMapper on FullDataResponse {
  List<DataChartsViewData> toChartData() {
    return btc_timeseries
        .map((timeseries) => DataChartsViewData(
              btc_timeseries: btc_timeseries,
            ))
        .toList();
  }
}
