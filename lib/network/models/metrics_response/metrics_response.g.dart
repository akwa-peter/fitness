// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetricsResponse _$MetricsResponseFromJson(Map<String, dynamic> json) =>
    _MetricsResponse(
      isSuccessful: json['isSuccessful'] as bool?,
      code: (json['code'] as num?)?.toInt(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Metrics.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MetricsResponseToJson(_MetricsResponse instance) =>
    <String, dynamic>{
      'isSuccessful': instance.isSuccessful,
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
