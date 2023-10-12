import 'dart:io';

import 'package:dio/dio.dart';

import '../env/env.dart';

Dio googleDioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: Env.googleApiBaseUrl,
      queryParameters: {
        'key': Platform.isAndroid
            ? Env.googleMapAndroidApiKey
            : Env.googleMapIosApiKey,
      },
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

Dio mapDioClient() {
  final dio = Dio();

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
