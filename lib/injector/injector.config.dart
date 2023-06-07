// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../application/auth_bloc/auth_bloc.dart' as _i18;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i19;
import '../application/login_cubit/login_cubit.dart' as _i16;
import '../application/password/password_cubit.dart' as _i7;
import '../application/register_cubit/register_cubit.dart' as _i17;
import '../domain/domain.dart' as _i13;
import '../infrastructure/auth_facade.dart' as _i14;
import '../infrastructure/datasources/aqi/air_quality_local_datasource.dart'
    as _i11;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i12;
import '../infrastructure/datasources/datasources.dart' as _i15;
import '../services/firebase_auth_service.dart' as _i4;
import '../services/mail_app_service.dart' as _i6;
import '../services/secure_storage_service.dart' as _i8;
import '../services/services.dart' as _i10;
import 'register_module.dart' as _i20;

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
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i4.FirebaseAuthService>(
        () => _i4.FirebaseAuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i6.MailAppService>(() => _i6.MailAppService());
    gh.factory<_i7.PasswordCubit>(() => _i7.PasswordCubit());
    gh.lazySingleton<_i8.SecureStorageService>(
        () => _i8.SecureStorageService(gh<_i5.FlutterSecureStorage>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModule.pref,
      preResolve: true,
    );
    await gh.factoryAsync<_i10.SharedPreferencesService>(
      () => registerModule.sharedPrefService,
      preResolve: true,
    );
    gh.factory<_i11.AirQualityLocalDatasource>(() =>
        _i11.AirQualityLocalDatasource(gh<_i10.SharedPreferencesService>()));
    gh.lazySingleton<_i12.AuthLocalDatasource>(
        () => _i12.AuthLocalDatasource(gh<_i10.SecureStorageService>()));
    gh.factory<_i13.IAuthFacade>(() => _i14.AuthFacade(
          gh<_i10.FirebaseAuthService>(),
          gh<_i15.AuthLocalDatasource>(),
        ));
    gh.factory<_i16.LoginCubit>(() => _i16.LoginCubit(gh<_i13.IAuthFacade>()));
    gh.factory<_i17.RegisterCubit>(
        () => _i17.RegisterCubit(gh<_i13.IAuthFacade>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(gh<_i13.IAuthFacade>()));
    gh.factory<_i19.ForgotPasswordCubit>(() => _i19.ForgotPasswordCubit(
          gh<_i13.IAuthFacade>(),
          gh<_i10.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}
