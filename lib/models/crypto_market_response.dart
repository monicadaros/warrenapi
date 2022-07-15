import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_response.g.dart';

@JsonSerializable()
class CryptoMarketResponse {
  final num price_usd;
  final num percent_change_usd_last_1_hour;

  CryptoMarketResponse(this.price_usd, this.percent_change_usd_last_1_hour);

  factory CryptoMarketResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketResponseToJson(this);
}
