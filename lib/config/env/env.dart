import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'IQ_AIR_API')
  static final String iqAirApi = _Env.iqAirApi;
 
  @EnviedField(varName: 'IQ_AIR_BASE_URL')
  static final String iqAirBaseUrl = _Env.iqAirBaseUrl;
}
