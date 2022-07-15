// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_full_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullDataResponse _$FullDataResponseFromJson(Map<String, dynamic> json) =>
    FullDataResponse(
      (json['data'] as List<dynamic>)
          .map((e) => CryptoDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FullDataResponseToJson(FullDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
