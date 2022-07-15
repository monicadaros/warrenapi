import 'package:json_annotation/json_annotation.dart';

import 'crypto_full_market_response.dart';

part 'crypto_data_response.g.dart';

@JsonSerializable()
class CryptoDataResponse {
  final String symbol;
  final String name;
  final String slug;
  final CryptoFullMarketResponse metrics;

  CryptoDataResponse(this.name, this.slug, this.symbol, this.metrics);

  factory CryptoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDataResponseToJson(this);
}
