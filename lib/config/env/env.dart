import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'WAQI_API_TOKEN')
  static final String waqiApiToken = _Env.waqiApiToken;

  @EnviedField(varName: 'WAQI_BASE_URL')
  static final String waqiBaseUrl = _Env.waqiBaseUrl;

  @EnviedField(varName: 'GOOGLE_API_BASE_URL')
  static final String googleApiBaseUrl = _Env.googleApiBaseUrl;

  @EnviedField(varName: 'GOOGLE_MAP_ANDROID_API_KEY')
  static final String googleMapAndroidApiKey = _Env.googleMapAndroidApiKey;

  @EnviedField(varName: 'GOOGLE_MAP_IOS_API_KEY')
  static final String googleMapIosApiKey = _Env.googleMapIosApiKey;
}
