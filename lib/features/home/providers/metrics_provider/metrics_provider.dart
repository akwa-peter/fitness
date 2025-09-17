import 'dart:developer';

import 'package:fitness/network/api_repository/api_service.dart';
import 'package:fitness/network/models/metrics/metrics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metrics_provider.g.dart';

@Riverpod(keepAlive: true)
class GetMetrics extends _$GetMetrics {
  AsyncValue<List<Metrics>> build() {
    return const AsyncLoading();
  }

  getMetrics() async {
    state = AsyncLoading();

    try {
      log("Called provider get metrics");
      var response = await ref.read(apiServiceProvider).getMetrics();
      if (response.isSuccessful) {
        state = AsyncData(response.data);
      }
      else {
        state = AsyncError(response.message, StackTrace.empty);
      }
    }
    catch (e){
      state = AsyncError(e.toString(), StackTrace.empty);
    }
  }
}