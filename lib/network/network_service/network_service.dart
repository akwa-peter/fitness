import 'dart:convert';

import 'package:fitness/network/models/metrics_response/metrics_response.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_service.g.dart';

@riverpod
NetworkService networkService(ref){
  return NetworkService();
}

class NetworkService {
  Future<MetricsResponse> getMetrics() async {
    Future.delayed(Duration(seconds: 2)); //Simulate delay
    String response = await rootBundle.loadString("assets/mock_responses/metrics_response.json");

    return MetricsResponse.fromJson(jsonDecode(response));
  }
}