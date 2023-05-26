// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/router/router.dart' as _i3;
import '../application/auth_bloc/auth_bloc.dart' as _i16;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i17;
import '../application/login_cubit/login_cubit.dart' as _i14;
import '../application/register_cubit/register_cubit.dart' as _i15;
import '../domain/domain.dart' as _i11;
import '../infrastructure/auth_facade.dart' as _i12;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i9;
import '../infrastructure/datasources/datasources.dart' as _i13;
import '../services/firebase_auth_service.dart' as _i5;
import '../services/mail_app_service.dart' as _i7;
import '../services/secure_storage_service.dart' as _i8;
import '../services/services.dart' as _i10;
import 'register_module.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i5.FirebaseAuthService>(
        () => _i5.FirebaseAuthService(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i7.MailAppService>(() => _i7.MailAppService());
    gh.lazySingleton<_i8.SecureStorageService>(
        () => _i8.SecureStorageService(gh<_i6.FlutterSecureStorage>()));
    gh.lazySingleton<_i9.AuthLocalDatasource>(
        () => _i9.AuthLocalDatasource(gh<_i10.SecureStorageService>()));
    gh.factory<_i11.IAuthFacade>(() => _i12.AuthFacade(
          gh<_i10.FirebaseAuthService>(),
          gh<_i13.AuthLocalDatasource>(),
        ));
    gh.factory<_i14.LoginCubit>(() => _i14.LoginCubit(gh<_i11.IAuthFacade>()));
    gh.factory<_i15.RegisterCubit>(
        () => _i15.RegisterCubit(gh<_i11.IAuthFacade>()));
    gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(gh<_i11.IAuthFacade>()));
    gh.factory<_i17.ForgotPasswordCubit>(() => _i17.ForgotPasswordCubit(
          gh<_i11.IAuthFacade>(),
          gh<_i10.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
