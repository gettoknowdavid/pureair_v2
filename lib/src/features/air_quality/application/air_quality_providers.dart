import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/domain/domain.dart';
import 'package:pureair_v2/src/features/air_quality/infrastructure/air_quality_facade.dart';
import 'package:pureair_v2/src/features/air_quality/infrastructure/datasources/datasources.dart';
import 'package:pureair_v2/src/services/objectbox_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'air_quality_providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  final param = {'token': Env.waqiApiToken};
  final options = BaseOptions(baseUrl: Env.waqiBaseUrl, queryParameters: param);
  return Dio(options);
}

@riverpod
AirQualityRemoteDatasource airQualityRemoteDatasource(Ref ref) {
  return AirQualityRemoteDatasource(ref.read(dioProvider));
}

@riverpod
AirQualityLocalDatasource airQualityLocalDatasource(Ref ref) {
  return AirQualityLocalDatasource(objectbox: ref.watch(objectboxProvider));
}

@riverpod
IAirQualityFacade airQualityFacade(Ref ref) {
  return AQIFacade(
    remote: ref.read(airQualityRemoteDatasourceProvider),
    local: ref.read(airQualityLocalDatasourceProvider),
  );
}
