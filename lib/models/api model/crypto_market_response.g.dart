// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMarketResponse _$CryptoMarketResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoMarketResponse(
      json['price_usd'] as num,
      json['percent_change_usd_last_1_hour'] as num,
      VariationDay.fromJson(json['ohlcv_last_1_hour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoMarketResponseToJson(
        CryptoMarketResponse instance) =>
    <String, dynamic>{
      'price_usd': instance.price_usd,
      'percent_change_usd_last_1_hour': instance.percent_change_usd_last_1_hour,
      'ohlcv_last_1_hour': instance.ohlcv_last_1_hour,
    };
