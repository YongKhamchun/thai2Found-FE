import 'package:thai2found/thai2found.dart';
import 'package:thai2found/injection.dart' as di;

class RouterGenerator {
  static bool _isInit = false;
  static get providers => null;

  static Route? generateRoute(RouteSettings settings) {
    Widget? page;
    Route? currentRoute;
    if (settings.name != null &&
        settings.name!.startsWith(rootThai2FoundRoute)) {
      if (!_isInit) {
        di.init();
        _isInit = true;
      }
    } else if (_isInit) {
      di.exit();
      _isInit = false;
    }

    switch (settings.name) {
      case SplashScreenPage.routeName:
        page = MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.locator<SplashScreenBloc>(),
            ),
          ],
          child: SplashScreenPage(),
        );
        break;
      case SignUpPage.routeName:
        page = const SignUpPage();
        break;
      default:
        break;
    }
    if (page != null) {
      return MaterialPageRoute(settings: settings, builder: (_) => page!);
    }
    return currentRoute;
  }
}
