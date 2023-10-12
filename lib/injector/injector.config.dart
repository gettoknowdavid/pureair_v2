// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../src/features/air_quality/application/air_quality_cubit/air_quality_cubit.dart'
    as _i28;
import '../src/features/air_quality/application/aq_map/aq_map_cubit.dart'
    as _i27;
import '../src/features/air_quality/application/rank_cubit/rank_cubit.dart'
    as _i25;
import '../src/features/air_quality/application/search_cubit/search_cubit.dart'
    as _i26;
import '../src/features/air_quality/domain/i_air_quality_facade.dart' as _i23;
import '../src/features/air_quality/infrastructure/air_quality_facade.dart'
    as _i24;
import '../src/features/air_quality/infrastructure/datasources/aq_local_datasource.dart'
    as _i20;
import '../src/features/air_quality/infrastructure/datasources/datasources.dart'
    as _i3;
import '../src/features/auth/application/auth_bloc/auth_bloc.dart' as _i21;
import '../src/features/auth/application/forgot_password_cubit/forgot_password_cubit.dart'
    as _i22;
import '../src/features/auth/application/login_form_cubit/login_form_cubit.dart'
    as _i11;
import '../src/features/auth/application/password_cubit/password_cubit.dart'
    as _i16;
import '../src/features/auth/application/register_form_cubit/register_form_cubit.dart'
    as _i17;
import '../src/features/auth/domain/domain.dart' as _i12;
import '../src/features/auth/domain/i_auth_facade.dart' as _i8;
import '../src/features/auth/infrastructure/auth_facade.dart' as _i9;
import '../src/features/map/application/map_cubit/map_cubit.dart' as _i14;
import '../src/router/app_router.dart' as _i5;
import '../src/services/firebase_auth_service.dart' as _i7;
import '../src/services/location_service.dart' as _i10;
import '../src/services/mail_app_service.dart' as _i13;
import '../src/services/secure_storage_service.dart' as _i18;
import '../src/services/services.dart' as _i15;
import 'register_module.dart' as _i29;

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
    gh.factory<_i8.IAuthFacade>(
        () => _i9.AuthFacade(gh<_i7.FirebaseAuthService>()));
    gh.singleton<_i10.LocationService>(_i10.LocationService());
    gh.factory<_i11.LoginFormCubit>(
        () => _i11.LoginFormCubit(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i13.MailAppService>(() => _i13.MailAppService());
    gh.factory<_i14.MapCubit>(() => _i14.MapCubit(gh<_i15.LocationService>()));
    await gh.factoryAsync<_i15.ObjectBoxService>(
      () => registerModule.obj,
      preResolve: true,
    );
    gh.factory<_i16.PasswordCubit>(() => _i16.PasswordCubit());
    gh.factory<_i17.RegisterFormCubit>(
        () => _i17.RegisterFormCubit(gh<_i12.IAuthFacade>()));
    gh.lazySingleton<_i18.SecureStorageService>(
        () => _i18.SecureStorageService(gh<_i4.FlutterSecureStorage>()));
    await gh.factoryAsync<_i19.SharedPreferences>(
      () => registerModule.pref,
      preResolve: true,
    );
    await gh.factoryAsync<_i15.SharedPreferencesService>(
      () => registerModule.sharedPrefService,
      preResolve: true,
    );
    gh.lazySingleton<_i20.AQLocalDatasource>(
        () => _i20.AQLocalDatasource(gh<_i15.ObjectBoxService>()));
    gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(gh<_i12.IAuthFacade>()));
    gh.factory<_i22.ForgotPasswordCubit>(() => _i22.ForgotPasswordCubit(
          gh<_i12.IAuthFacade>(),
          gh<_i15.MailAppService>(),
        ));
    gh.lazySingleton<_i23.IAirQualityFacade>(() => _i24.AirQualityFacade(
          gh<_i3.AQLocalDatasource>(),
          gh<_i3.AQRemoteDatasource>(),
        ));
    gh.factory<_i25.RankCubit>(() => _i25.RankCubit(
          gh<_i23.IAirQualityFacade>(),
          gh<_i15.LocationService>(),
        ));
    gh.factory<_i26.SearchCubit>(
        () => _i26.SearchCubit(gh<_i23.IAirQualityFacade>()));
    gh.factory<_i27.AQMapCubit>(() => _i27.AQMapCubit(
          gh<_i15.LocationService>(),
          gh<_i23.IAirQualityFacade>(),
        ));
    gh.factory<_i28.AirQualityCubit>(
        () => _i28.AirQualityCubit(gh<_i23.IAirQualityFacade>()));
    return this;
  }
}

class _$RegisterModule extends _i29.RegisterModule {}
