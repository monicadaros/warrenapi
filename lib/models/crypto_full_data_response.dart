import 'package:json_annotation/json_annotation.dart';
import 'crypto_data_response.dart';

part 'crypto_full_data_response.g.dart';

@JsonSerializable()
class FullDataResponse {
  final List<CryptoDataResponse> data;

  FullDataResponse(this.data);

  factory FullDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FullDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FullDataResponseToJson(this);
}
