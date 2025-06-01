// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/air_quality/air_quality.dart' as _i36;
import '../features/air_quality/repository/air_quality_repository_impl.dart'
    as _i200;
import '../features/air_quality/repository/datasources/air_quality_remote_datasource.dart'
    as _i626;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.factory<String>(
      () => registerModule.token,
      instanceName: 'token',
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio(
          gh<String>(instanceName: 'baseUrl'),
          gh<String>(instanceName: 'token'),
        ));
    gh.factory<_i626.AirQualityRemoteDatasource>(
        () => _i626.AirQualityRemoteDatasource(
              gh<_i361.Dio>(),
              baseUrl: gh<String>(instanceName: 'baseUrl'),
            ));
    gh.factory<_i36.AirQualityRepository>(() => _i200.AirQualityRepositoryImpl(
          local: gh<_i36.AirQualityLocalDatasource>(),
          remote: gh<_i36.AirQualityRemoteDatasource>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
