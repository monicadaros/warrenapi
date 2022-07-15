import 'package:json_annotation/json_annotation.dart';

part 'crypto_marketcap_response.g.dart';

@JsonSerializable()
class CryptoMarketcapResponse {
  final num marketcap_dominance_percent;

  CryptoMarketcapResponse(this.marketcap_dominance_percent);

  factory CryptoMarketcapResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoMarketcapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketcapResponseToJson(this);
}
