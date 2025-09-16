import 'dart:developer';

import 'package:fitness/network/network_service/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

@riverpod
ApiService apiService(ref){
  final networkService = ref.watch(networkServiceProvider);
  return ApiService(networkService: networkService);
}

class ApiService {
  NetworkService networkService;
  ApiService({required this.networkService});

  Future getMetrics() async {
    log("Called api service get metrics");
    return await networkService.getMetrics();
  }
}