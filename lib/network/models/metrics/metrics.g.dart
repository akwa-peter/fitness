// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metrics _$MetricsFromJson(Map<String, dynamic> json) => _Metrics(
  title: json['title'] as String?,
  icon: json['icon'] as String?,
  chart: json['chart'] as String?,
  percentage: json['percentage'] as String?,
  unit: json['unit'] as String?,
  color: json['color'] as String?,
);

Map<String, dynamic> _$MetricsToJson(_Metrics instance) => <String, dynamic>{
  'title': instance.title,
  'icon': instance.icon,
  'chart': instance.chart,
  'percentage': instance.percentage,
  'unit': instance.unit,
  'color': instance.color,
};
