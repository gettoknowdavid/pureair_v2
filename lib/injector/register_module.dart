import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/config/client/client.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/infrastructure/datasources/air_quality/aq_remote_datasource.dart';
import 'package:pureair_v2/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  final _dio = dioClient();

  @lazySingleton
  AQRemoteDatasource get aqRemote {
    return AQRemoteDatasource(_dio, baseUrl: Env.waqiBaseUrl);
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
