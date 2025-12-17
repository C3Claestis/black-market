import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitam_market/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';
import '../page/splashscreen_page.dart';
import '../page/getstarted_page.dart';
import '../provider/splashscreen_prov.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashscreenProv()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashscreenPage(),
        AppRoutes.getstarted: (context) => const GetstartedPage(),
      },
    );
  }
}

class AppRoutes {
  static const home = "/";
  static const splash = "/splash";
  static const getstarted = "/getstarted";
  static const login = "/login";
  static const register = "/register";
  static const forgotpassword = "/forgotpassword";
  static const profile = "/profile";
}
