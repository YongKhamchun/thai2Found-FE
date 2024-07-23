import 'package:get_it/get_it.dart';
import 'package:thai2found/thai2found.dart';

final locator = GetIt.instance;

void init() {
  //Bloc
  if (!locator.isRegistered<SplashScreenBloc>()) {
    locator.registerLazySingleton(() => SplashScreenBloc());
  }
}

void exit() {}
