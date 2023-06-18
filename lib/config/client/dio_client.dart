import 'package:dio/dio.dart';

import '../env/env.dart';

Dio dioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: Env.waqiBaseUrl,
      queryParameters: {'token': Env.waqiApiToken},
    );

  dio.interceptors.addAll([
    LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  ]);

  return dio;
}
