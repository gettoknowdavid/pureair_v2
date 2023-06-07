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
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../application/auth_bloc/auth_bloc.dart' as _i21;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i22;
import '../application/login_cubit/login_cubit.dart' as _i19;
import '../application/password/password_cubit.dart' as _i12;
import '../application/register_cubit/register_cubit.dart' as _i20;
import '../config/router/app_router.dart' as _i4;
import '../domain/domain.dart' as _i8;
import '../infrastructure/air_quality_facade.dart' as _i9;
import '../infrastructure/auth_facade.dart' as _i18;
import '../infrastructure/datasources/aqi/air_quality_local_datasource.dart'
    as _i16;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i17;
import '../infrastructure/datasources/datasources.dart' as _i10;
import '../infrastructure/infrastructure.dart' as _i3;
import '../services/firebase_auth_service.dart' as _i6;
import '../services/mail_app_service.dart' as _i11;
import '../services/secure_storage_service.dart' as _i13;
import '../services/services.dart' as _i15;
import 'register_module.dart' as _i23;

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
    gh.lazySingleton<_i11.MailAppService>(() => _i11.MailAppService());
    gh.factory<_i12.PasswordCubit>(() => _i12.PasswordCubit());
    gh.lazySingleton<_i13.SecureStorageService>(
        () => _i13.SecureStorageService(gh<_i7.FlutterSecureStorage>()));
    await gh.factoryAsync<_i14.SharedPreferences>(
      () => registerModule.pref,
      preResolve: true,
    );
    await gh.factoryAsync<_i15.SharedPreferencesService>(
      () => registerModule.sharedPrefService,
      preResolve: true,
    );
    gh.factory<_i16.AirQualityLocalDatasource>(() =>
        _i16.AirQualityLocalDatasource(gh<_i15.SharedPreferencesService>()));
    gh.lazySingleton<_i17.AuthLocalDatasource>(
        () => _i17.AuthLocalDatasource(gh<_i15.SecureStorageService>()));
    gh.factory<_i8.IAuthFacade>(() => _i18.AuthFacade(
          gh<_i15.FirebaseAuthService>(),
          gh<_i10.AuthLocalDatasource>(),
        ));
    gh.factory<_i19.LoginCubit>(() => _i19.LoginCubit(gh<_i8.IAuthFacade>()));
    gh.factory<_i20.RegisterCubit>(
        () => _i20.RegisterCubit(gh<_i8.IAuthFacade>()));
    gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(gh<_i8.IAuthFacade>()));
    gh.factory<_i22.ForgotPasswordCubit>(() => _i22.ForgotPasswordCubit(
          gh<_i8.IAuthFacade>(),
          gh<_i15.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
