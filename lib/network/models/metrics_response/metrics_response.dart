import 'package:fitness/network/models/metrics/metrics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metrics_response.freezed.dart';
part 'metrics_response.g.dart';

@freezed
abstract class MetricsResponse with _$MetricsResponse{
  const factory MetricsResponse({
    bool? isSuccessful,
    int? code,
    List<Metrics>? data,
    String? message,
  }) = _MetricsResponse;

  factory MetricsResponse.fromJson(Map<String, dynamic> json) => _$MetricsResponseFromJson(json);
}
