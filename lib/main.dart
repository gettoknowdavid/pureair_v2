import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/app.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/services/location_service.dart';

import 'firebase_options.dart';
import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  await di<LocationService>().determinePosition();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => di<LoginCubit>()),
        BlocProvider(create: (ctx) => di<RegisterCubit>()),
        BlocProvider(create: (ctx) => di<ForgotPasswordCubit>()),
        BlocProvider(create: (ctx) => di<PasswordCubit>()),
        BlocProvider(create: (ctx) => di<SearchCubit>()),
        BlocProvider(create: (ctx) => di<AuthBloc>()),
        BlocProvider(create: (ctx) => di<MapCubit>()..initialized()),
        BlocProvider(
          create: (ctx) => di<AirQualityCubit>()..initialized(),
          lazy: true,
        ),
      ],
      child: const PureAirApp(),
    ),
  );
}
