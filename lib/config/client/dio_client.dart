import 'package:dio/dio.dart';

import '../env/env.dart';

Dio dioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: Env.iqAirBaseUrl,
      queryParameters: {'token': Env.iqAirApi},
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
