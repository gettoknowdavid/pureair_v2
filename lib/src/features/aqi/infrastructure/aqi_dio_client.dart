import 'package:dio/dio.dart';
import 'package:pureair_v2/src/core/env/env.dart';

Dio get aqiDioClient {
  final options = BaseOptions(
    baseUrl: Env.waqiBaseUrl,
    queryParameters: {'token': Env.waqiApiToken},
  );
  final dio = Dio(options);
  return dio;
}
