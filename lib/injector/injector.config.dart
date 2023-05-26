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

import '../application/auth_bloc/auth_bloc.dart' as _i15;
import '../application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i16;
import '../application/login_cubit/login_cubit.dart' as _i13;
import '../application/register_cubit/register_cubit.dart' as _i14;
import '../domain/domain.dart' as _i10;
import '../infrastructure/auth_facade.dart' as _i11;
import '../infrastructure/datasources/auth_local_datasource.dart' as _i8;
import '../infrastructure/datasources/datasources.dart' as _i12;
import '../services/firebase_auth_service.dart' as _i4;
import '../services/mail_app_service.dart' as _i6;
import '../services/secure_storage_service.dart' as _i7;
import '../services/services.dart' as _i9;
import 'register_module.dart' as _i17;

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
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i4.FirebaseAuthService>(
        () => _i4.FirebaseAuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i6.MailAppService>(() => _i6.MailAppService());
    gh.lazySingleton<_i7.SecureStorageService>(
        () => _i7.SecureStorageService(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i8.AuthLocalDatasource>(
        () => _i8.AuthLocalDatasource(gh<_i9.SecureStorageService>()));
    gh.factory<_i10.IAuthFacade>(() => _i11.AuthFacade(
          gh<_i9.FirebaseAuthService>(),
          gh<_i12.AuthLocalDatasource>(),
        ));
    gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(gh<_i10.IAuthFacade>()));
    gh.factory<_i14.RegisterCubit>(
        () => _i14.RegisterCubit(gh<_i10.IAuthFacade>()));
    gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(gh<_i10.IAuthFacade>()));
    gh.factory<_i16.ForgotPasswordCubit>(() => _i16.ForgotPasswordCubit(
          gh<_i10.IAuthFacade>(),
          gh<_i9.MailAppService>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
