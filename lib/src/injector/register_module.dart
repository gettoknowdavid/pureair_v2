import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/core/core.dart' show Env;
import 'package:pureair_v2/src/database/database.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => Env.waqiBaseUrl;

  @Named('token')
  String get token => Env.waqiApiToken;

  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl, @Named('token') String token) {
    final params = {'token': token};
    final options = BaseOptions(baseUrl: baseUrl, queryParameters: params);
    return Dio(options);
  }

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  GoogleSignIn get googleSignIn {
    const scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    return GoogleSignIn(scopes: scopes);
  }

  @preResolve
  Future<PureAirDatabase> get database => PureAirDatabase.create();
}
