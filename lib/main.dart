import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'injector/injector.dart';
import 'src/features/air_quality/application/air_quality_cubit/air_quality_cubit.dart';
import 'src/features/air_quality/application/aq_map/aq_map_cubit.dart';
import 'src/features/air_quality/application/rank_cubit/rank_cubit.dart';
import 'src/features/air_quality/application/search_cubit/search_cubit.dart';
import 'src/features/auth/application/application.dart';
import 'src/features/map/application/map_cubit/map_cubit.dart';
import 'src/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();

  await di<LocationService>().determinePosition();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => di<LoginFormCubit>()),
        BlocProvider(create: (ctx) => di<RegisterFormCubit>()),
        BlocProvider(create: (ctx) => di<PasswordCubit>()),
        BlocProvider(create: (ctx) => di<ForgotPasswordCubit>()),
        BlocProvider(create: (ctx) => di<SearchCubit>()),
        BlocProvider(
          create: (ctx) => di<AuthBloc>()..add(const AuthEvent.authChecked()),
        ),
        BlocProvider(create: (ctx) => di<MapCubit>(), lazy: false),
        BlocProvider(create: (ctx) => di<AQMapCubit>()..initialized()),
        BlocProvider(create: (ctx) => di<RankCubit>()..initialized()),
        BlocProvider(create: (ctx) => di<AirQualityCubit>()..initialized()),
      ],
      child: const PureAirApp(),
    ),
  );
}
