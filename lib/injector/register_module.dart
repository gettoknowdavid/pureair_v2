import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';
import 'package:pureair_v2/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
