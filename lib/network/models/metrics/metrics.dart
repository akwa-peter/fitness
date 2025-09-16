import 'package:freezed_annotation/freezed_annotation.dart';

part 'metrics.freezed.dart';
part 'metrics.g.dart';

@freezed
abstract class Metrics with _$Metrics {
  const factory Metrics({
    String? title,
    String? icon,
    String? chart,
    String? percentage,
    String? unit,
    String? color,
  }) = _Metrics;

  factory Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);
}