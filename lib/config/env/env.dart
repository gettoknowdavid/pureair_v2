import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'OPEN_WEATHER_API_KEY')
  static final String openWeatherApiKey = _Env.openWeatherApiKey;

  @EnviedField(varName: 'OPEN_WEATHER_BASE_URL')
  static final String openWeatherBaseUrl = _Env.openWeatherBaseUrl;

  @EnviedField(varName: 'WAQI_API_TOKEN')
  static final String waqiApiToken = _Env.waqiApiToken;

  @EnviedField(varName: 'WAQI_BASE_URL')
  static final String waqiBaseUrl = _Env.waqiBaseUrl;
}
