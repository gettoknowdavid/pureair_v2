// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../application/air_quality_cubit/air_quality_cubit.dart' as _i25;
import '../application/auth_bloc/auth_bloc.dart' as _i26;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i27;
import '../application/login_cubit/login_cubit.dart' as _i20;
import '../application/map/map_cubit.dart' as _i21;
import '../application/password_cubit/password_cubit.dart' as _i11;
import '../application/rank_cubit/rank_cubit.dart' as _i22;
import '../application/register_cubit/register_cubit.dart' as _i23;
import '../application/search_cubit/search_cubit.dart' as _i24;
import '../config/router/app_router.dart' as _i5;
import '../domain/domain.dart' as _i16;
import '../infrastructure/air_quality_facade.dart' as _i17;
import '../infrastructure/auth_facade.dart' as _i18;
import '../infrastructure/datasources/air_quality/aq_local_datasource.dart'
    as _i14;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i15;
import '../infrastructure/datasources/datasources.dart' as _i19;
import '../infrastructure/infrastructure.dart' as _i3;
import '../services/firebase_auth_service.dart' as _i7;
import '../services/location_service.dart' as _i8;
import '../services/mail_app_service.dart' as _i9;
import '../services/secure_storage_service.dart' as _i12;
import '../services/services.dart' as _i10;
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
    gh.lazySingleton<_i3.AQRemoteDatasource>(() => registerModule.aqRemote);
    gh.factory<_i4.AndroidOptions>(() => registerModule.aOptions);
    gh.factory<_i5.AppRouter>(() => _i5.AppRouter());
    gh.lazySingleton<_i6.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i7.FirebaseAuthService>(
        () => _i7.FirebaseAuthService(gh<_i6.FirebaseAuth>()));
    gh.lazySingleton<_i4.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.singleton<_i8.LocationService>(_i8.LocationService());
    gh.lazySingleton<_i9.MailAppService>(() => _i9.MailAppService());
    await gh.factoryAsync<_i10.ObjectBoxService>(
      () => registerModule.obj,
      preResolve: true,
    );
    gh.factory<_i11.PasswordCubit>(() => _i11.PasswordCubit());
    gh.lazySingleton<_i12.SecureStorageService>(
        () => _i12.SecureStorageService(gh<_i4.FlutterSecureStorage>()));
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => registerModule.pref,
      preResolve: true,
    );
    await gh.factoryAsync<_i10.SharedPreferencesService>(
      () => registerModule.sharedPrefService,
      preResolve: true,
    );
    gh.lazySingleton<_i14.AQLocalDatasource>(
        () => _i14.AQLocalDatasource(gh<_i10.ObjectBoxService>()));
    gh.lazySingleton<_i15.AuthLocalDatasource>(
        () => _i15.AuthLocalDatasource(gh<_i10.SecureStorageService>()));
    gh.lazySingleton<_i16.IAirQualityFacade>(() => _i17.AirQualityFacade(
          gh<_i3.AQLocalDatasource>(),
          gh<_i3.AQRemoteDatasource>(),
        ));
    gh.factory<_i16.IAuthFacade>(() => _i18.AuthFacade(
          gh<_i10.FirebaseAuthService>(),
          gh<_i19.AuthLocalDatasource>(),
        ));
    gh.factory<_i20.LoginCubit>(() => _i20.LoginCubit(gh<_i16.IAuthFacade>()));
    gh.factory<_i21.MapCubit>(() => _i21.MapCubit(
          gh<_i8.LocationService>(),
          gh<_i16.IAirQualityFacade>(),
        ));
    gh.factory<_i22.RankCubit>(() => _i22.RankCubit(
          gh<_i16.IAirQualityFacade>(),
          gh<_i8.LocationService>(),
        ));
    gh.factory<_i23.RegisterCubit>(
        () => _i23.RegisterCubit(gh<_i16.IAuthFacade>()));
    gh.factory<_i24.SearchCubit>(
        () => _i24.SearchCubit(gh<_i16.IAirQualityFacade>()));
    gh.factory<_i25.AirQualityCubit>(
        () => _i25.AirQualityCubit(gh<_i16.IAirQualityFacade>()));
    gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(gh<_i16.IAuthFacade>()));
    gh.factory<_i27.ForgotPasswordCubit>(() => _i27.ForgotPasswordCubit(
          gh<_i16.IAuthFacade>(),
          gh<_i10.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
