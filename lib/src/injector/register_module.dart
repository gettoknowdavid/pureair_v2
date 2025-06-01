import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/core/core.dart' show Env;

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => Env.waqiBaseUrl;

  @Named('token')
  String get token => Env.waqiApiToken;

  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl, @Named('token') String token) {
    final params = {'token': token};
    final options = BaseOptions(baseUrl: baseUrl, queryParameters: params);
    return Dio(options);
  }
}
