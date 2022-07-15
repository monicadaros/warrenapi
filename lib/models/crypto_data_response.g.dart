// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoDataResponse _$CryptoDataResponseFromJson(Map<String, dynamic> json) =>
    CryptoDataResponse(
      json['name'] as String,
      json['slug'] as String,
      json['symbol'] as String,
      CryptoFullMarketResponse.fromJson(
          json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoDataResponseToJson(CryptoDataResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'slug': instance.slug,
      'metrics': instance.metrics,
    };
