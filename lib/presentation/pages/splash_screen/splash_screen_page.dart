import 'package:thai2found/thai2found.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '$rootThai2FoundRoute/splash_screen';

  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    context.read<SplashScreenBloc>().add(OnLoadedSplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 233, 213, 1),
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenLoaded) {
            Navigator.of(context).pushReplacementNamed(SignUpPage.routeName);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.network(
                    'https://cdn.dribbble.com/users/1142616/screenshots/5310753/loading-dog.gif')),
          ],
        ),
      ),
    );
  }
}
