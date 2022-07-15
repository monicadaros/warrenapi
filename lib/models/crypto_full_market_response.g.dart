// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_full_market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoFullMarketResponse _$CryptoFullMarketResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoFullMarketResponse(
      CryptoMarketResponse.fromJson(
          json['market_data'] as Map<String, dynamic>),
      CryptoMarketcapResponse.fromJson(
          json['marketcap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoFullMarketResponseToJson(
        CryptoFullMarketResponse instance) =>
    <String, dynamic>{
      'market_data': instance.market_data,
      'marketcap': instance.marketcap,
    };
