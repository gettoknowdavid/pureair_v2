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
import '../application/auth_bloc/auth_bloc.dart' as _i17;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i18;
import '../application/login_cubit/login_cubit.dart' as _i15;
import '../application/password/password_cubit.dart' as _i8;
import '../application/register_cubit/register_cubit.dart' as _i16;
import '../domain/domain.dart' as _i12;
import '../infrastructure/auth_facade.dart' as _i13;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i10;
import '../infrastructure/datasources/datasources.dart' as _i14;
import '../services/firebase_auth_service.dart' as _i5;
import '../services/mail_app_service.dart' as _i7;
import '../services/secure_storage_service.dart' as _i9;
import '../services/services.dart' as _i11;
import 'register_module.dart' as _i19;

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
    gh.factory<_i8.PasswordCubit>(() => _i8.PasswordCubit());
    gh.lazySingleton<_i9.SecureStorageService>(
        () => _i9.SecureStorageService(gh<_i6.FlutterSecureStorage>()));
    gh.lazySingleton<_i10.AuthLocalDatasource>(
        () => _i10.AuthLocalDatasource(gh<_i11.SecureStorageService>()));
    gh.factory<_i12.IAuthFacade>(() => _i13.AuthFacade(
          gh<_i11.FirebaseAuthService>(),
          gh<_i14.AuthLocalDatasource>(),
        ));
    gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(gh<_i12.IAuthFacade>()));
    gh.factory<_i16.RegisterCubit>(
        () => _i16.RegisterCubit(gh<_i12.IAuthFacade>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i18.ForgotPasswordCubit>(() => _i18.ForgotPasswordCubit(
          gh<_i12.IAuthFacade>(),
          gh<_i11.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
