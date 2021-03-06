import 'package:json_annotation/json_annotation.dart';
import 'crypto_variation_day.dart';

part 'crypto_market_response.g.dart';

@JsonSerializable()
class CryptoMarketResponse {
  final num price_usd;
  final num percent_change_usd_last_1_hour;
  final VariationDay ohlcv_last_1_hour;

  CryptoMarketResponse(this.price_usd, this.percent_change_usd_last_1_hour,
      this.ohlcv_last_1_hour);

  factory CryptoMarketResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketResponseToJson(this);
}
