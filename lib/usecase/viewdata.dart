import '../models/api model/crypto_full_market_response.dart';

class DataCryptoViewData {
  final String symbol;
  final String name;
  final String slug;
  final CryptoFullMarketResponse metrics;

  DataCryptoViewData(
      {required this.metrics,
      required this.name,
      required this.slug,
      required this.symbol});
}
