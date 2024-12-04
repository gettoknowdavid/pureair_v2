import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'WAQI_API_TOKEN')
  static final String waqiApiToken = _Env.waqiApiToken;
}
