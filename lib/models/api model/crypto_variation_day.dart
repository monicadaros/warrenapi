import 'package:json_annotation/json_annotation.dart';

part 'crypto_variation_day.g.dart';

@JsonSerializable()
class VariationDay {
  final num high;
  final num low;

  VariationDay(this.high, this.low);

  factory VariationDay.fromJson(Map<String, dynamic> json) =>
      _$VariationDayFromJson(json);

  Map<String, dynamic> toJson() => _$VariationDayToJson(this);
}
