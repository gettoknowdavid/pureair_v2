import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/app.dart';
import 'package:pureair_v2/firebase_options.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (ctx) => di<AuthRepository>()),
        RepositoryProvider(create: (ctx) => di<AirQualityRepository>()),
        RepositoryProvider(create: (ctx) => di<AddCityUseCase>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => AuthBloc(
              repository: ctx.read<AuthRepository>(),
            )..add(const AuthUserSubscribed()),
          ),
          BlocProvider(
            create: (ctx) => CitiesBloc(
              repository: ctx.read<AirQualityRepository>(),
              addCityUseCase: ctx.read<AddCityUseCase>(),
            )..add(const CitiesStarted()),
          ),
          BlocProvider(
            create: (ctx) => LocalizedBloc(
              repository: ctx.read<AirQualityRepository>(),
            )..add(const LocalizedStarted()),
          ),
          BlocProvider(
            create: (ctx) => SearchBloc(
              repository: ctx.read<AirQualityRepository>(),
            ),
          )
        ],
        child: const PureAirApp(),
      ),
    ),
  );
}
