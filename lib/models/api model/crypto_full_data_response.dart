import 'package:json_annotation/json_annotation.dart';
import 'crypto_data_response.dart';

part 'crypto_full_data_response.g.dart';

@JsonSerializable()
class FullDataResponse {
  final List<CryptoDataResponse> data;
  final List<List<double>> btc_timeseries;

  FullDataResponse(this.data, this.btc_timeseries);

  factory FullDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FullDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FullDataResponseToJson(this);
}
