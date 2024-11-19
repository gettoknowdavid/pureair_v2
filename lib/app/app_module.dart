import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pureair_v2/app/app_routes.dart';
import 'package:pureair_v2/app/auth/auth.dart';
import 'package:pureair_v2/app/auth/domain/domain.dart';
import 'package:pureair_v2/app/auth/infrastructure/auth_facade.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(Injector i) {
    i
      ..add<FirebaseAuth>(() => FirebaseAuth.instance)
      ..add<GoogleSignIn>(GoogleSignIn.new)
      ..add<IAuthFacade>(AuthFacade.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(R.root, child: (_) => const HomePage())
      ..child(R.login, child: (_) => const LoginPage())
      ..child(R.register, child: (_) => const RegisterPage());
  }
}
