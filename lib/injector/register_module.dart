import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src/features/air_quality/infrastructure/datasources/datasources.dart';
import '../src/services/services.dart';
import '../src/utils/utils.dart';

@module
abstract class RegisterModule {
  final _aqiDio = dioClient();

  final aOptions = const AndroidOptions(encryptedSharedPreferences: true);

  @lazySingleton
  AQRemoteDatasource get aqRemote {
    return AQRemoteDatasource(_aqiDio, baseUrl: Env.waqiBaseUrl);
  }

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @preResolve
  Future<ObjectBoxService> get obj => ObjectBoxService.create();

  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage {
    return FlutterSecureStorage(aOptions: aOptions);
  }

  @preResolve
  Future<SharedPreferencesService> get sharedPrefService {
    return SharedPreferencesService.getInstance();
  }
}
