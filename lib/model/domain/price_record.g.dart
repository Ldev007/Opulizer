// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceRecordImpl _$$PriceRecordImplFromJson(Map<String, dynamic> json) =>
    _$PriceRecordImpl(
      opinion: json['opinion'] as String,
      probability: (json['probability'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PriceRecordImplToJson(_$PriceRecordImpl instance) =>
    <String, dynamic>{
      'opinion': instance.opinion,
      'probability': instance.probability,
      'timestamp': instance.timestamp.toIso8601String(),
    };
