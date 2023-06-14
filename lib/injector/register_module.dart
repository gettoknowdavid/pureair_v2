import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/config/client/client.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';
import 'package:pureair_v2/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  final _dio = dioClient();

  @lazySingleton
  AirQualityRemoteDatasource get authRemote {
    return AirQualityRemoteDatasource(_dio, baseUrl: Env.openWeatherBaseUrl);
  }

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @preResolve
  Future<SharedPreferencesService> get sharedPrefService {
    return SharedPreferencesService.getInstance();
  }
}
