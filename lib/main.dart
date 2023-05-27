import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/app/app.dart';
import 'package:pureair_v2/application/application.dart';

import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => di<LoginCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<RegisterCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<ForgotPasswordCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<AuthBloc>()),
      ],
      child: const PureAirApp(),
    ),
  );
}
