import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/injector/injector.config.dart';

final GetIt di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => di.init();
