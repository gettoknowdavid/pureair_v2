import 'package:flutter_modular/flutter_modular.dart';
import 'package:pureair_v2/app/app_routes.dart';
import 'package:pureair_v2/app/auth/auth.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r
      ..child(R.root, child: (_) => const HomePage())
      ..child(R.login, child: (_) => const LoginPage())
      ..child(R.register, child: (_) => const RegisterPage());
  }
}
