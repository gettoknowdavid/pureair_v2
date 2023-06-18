// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../application/air_quality_bloc/air_quality_bloc.dart' as _i17;
import '../application/auth_bloc/auth_bloc.dart' as _i26;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i27;
import '../application/location_cubit/location_cubit.dart' as _i22;
import '../application/login_cubit/login_cubit.dart' as _i23;
import '../application/password_cubit/password_cubit.dart' as _i13;
import '../application/register_cubit/register_cubit.dart' as _i24;
import '../application/weather_cubit/weather_cubit.dart' as _i25;
import '../config/router/app_router.dart' as _i4;
import '../domain/domain.dart' as _i8;
import '../infrastructure/air_quality_facade.dart' as _i9;
import '../infrastructure/auth_facade.dart' as _i20;
import '../infrastructure/datasources/aqi/air_quality_local_datasource.dart'
    as _i18;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i19;
import '../infrastructure/datasources/datasources.dart' as _i10;
import '../infrastructure/infrastructure.dart' as _i3;
import '../infrastructure/weather_facade.dart' as _i21;
import '../services/firebase_auth_service.dart' as _i6;
import '../services/location_service.dart' as _i11;
import '../services/mail_app_service.dart' as _i12;
import '../services/secure_storage_service.dart' as _i14;
import '../services/services.dart' as _i16;
import 'register_module.dart' as _i28;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AirQualityRemoteDatasource>(
        () => registerModule.authRemote);
    gh.factory<_i4.AppRouter>(() => _i4.AppRouter());
    gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i6.FirebaseAuthService>(
        () => _i6.FirebaseAuthService(gh<_i5.FirebaseAuth>()));
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i8.IAirQualityFacade>(
        () => _i9.AirQualityFacade(gh<_i10.AirQualityRemoteDatasource>()));
    gh.singleton<_i11.LocationService>(_i11.LocationService());
    gh.lazySingleton<_i12.MailAppService>(() => _i12.MailAppService());
    gh.factory<_i13.PasswordCubit>(() => _i13.PasswordCubit());
    gh.lazySingleton<_i14.SecureStorageService>(
        () => _i14.SecureStorageService(gh<_i7.FlutterSecureStorage>()));
    await gh.factoryAsync<_i15.SharedPreferences>(
      () => registerModule.pref,
      preResolve: true,
    );
    await gh.factoryAsync<_i16.SharedPreferencesService>(
      () => registerModule.sharedPrefService,
      preResolve: true,
    );
    gh.lazySingleton<_i3.WeatherRemoteDatasource>(
        () => registerModule.weatherRemote);
    gh.factory<_i17.AirQualityBloc>(
        () => _i17.AirQualityBloc(gh<_i8.IAirQualityFacade>()));
    gh.factory<_i18.AirQualityLocalDatasource>(() =>
        _i18.AirQualityLocalDatasource(gh<_i16.SharedPreferencesService>()));
    gh.lazySingleton<_i19.AuthLocalDatasource>(
        () => _i19.AuthLocalDatasource(gh<_i16.SecureStorageService>()));
    gh.factory<_i8.IAuthFacade>(() => _i20.AuthFacade(
          gh<_i16.FirebaseAuthService>(),
          gh<_i10.AuthLocalDatasource>(),
        ));
    gh.factory<_i8.IWeatherFacade>(
        () => _i21.WeatherFacade(gh<_i10.WeatherRemoteDatasource>()));
    gh.factory<_i22.LocationCubit>(
        () => _i22.LocationCubit(gh<_i11.LocationService>()));
    gh.factory<_i23.LoginCubit>(() => _i23.LoginCubit(gh<_i8.IAuthFacade>()));
    gh.factory<_i24.RegisterCubit>(
        () => _i24.RegisterCubit(gh<_i8.IAuthFacade>()));
    gh.factory<_i25.WeatherCubit>(() => _i25.WeatherCubit(
          gh<_i8.IWeatherFacade>(),
          gh<_i11.LocationService>(),
        ));
    gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i27.ForgotPasswordCubit>(() => _i27.ForgotPasswordCubit(
          gh<_i8.IAuthFacade>(),
          gh<_i16.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
