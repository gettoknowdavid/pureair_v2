import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/app.dart';
import 'package:pureair_v2/application/application.dart';

import 'firebase_options.dart';
import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => di<LoginCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<RegisterCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<ForgotPasswordCubit>(), lazy: true),
        BlocProvider(create: (ctx) => di<PasswordCubit>(), lazy: true),
        BlocProvider(
          create: (ctx) =>
              di<AirQualityBloc>()..add(const AirQualityEvent.initialized()),
          lazy: true,
        ),
        BlocProvider(
          create: (ctx) => di<WeatherCubit>()..initialized(),
          lazy: true,
        ),
        BlocProvider(create: (ctx) => di<LocationCubit>()..getUserLocation()),
        BlocProvider(create: (ctx) => di<AuthBloc>()),
      ],
      child: const PureAirApp(),
    ),
  );
}
