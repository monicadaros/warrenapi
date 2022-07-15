import 'package:json_annotation/json_annotation.dart';
import 'crypto_market_response.dart';
import 'crypto_marketcap_response.dart';

part 'crypto_full_market_response.g.dart';

@JsonSerializable()
class CryptoFullMarketResponse {
  final CryptoMarketResponse market_data;
  final CryptoMarketcapResponse marketcap;

  CryptoFullMarketResponse(this.market_data, this.marketcap);

  factory CryptoFullMarketResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoFullMarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoFullMarketResponseToJson(this);
}
