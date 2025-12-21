import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitam_market/page/forgot_password.dart';
import 'package:hitam_market/page/getstarted_page.dart';
import 'package:hitam_market/page/home_page.dart';
import 'package:hitam_market/page/signup_page.dart';
import 'package:hitam_market/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'page/splash_intro_page.dart';
import '../provider/password_visibility_prov.dart';
import '../page/sigin_page.dart';
import '../provider/onboarding_provider.dart';
import '../page/splashscreen_page.dart';
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
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
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
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.splash: (context) => const SplashscreenPage(),
        AppRoutes.splashIntro: (context) => const SplashIntro(),
        AppRoutes.signin: (context) => const SiginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
        AppRoutes.forgotpassword: (context) => const ForgotPassword(),
        AppRoutes.getstarted: (context) => const GetstartedPage(),
      },
    );
  }
}

class AppRoutes {
  static const home = "/";
  static const splash = "/splash";
  static const splashIntro = "/splashIntro";
  static const getstarted = "/getstarted";
  static const signin = "/signin";
  static const signup = "/signup";
  static const login = "/login";
  static const register = "/register";
  static const forgotpassword = "/forgotpassword";
  static const profile = "/profile";
}
