import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitam_market/page/payment/checkout_page.dart';
import 'package:provider/provider.dart';
import 'page/splash_intro_page.dart';
import '../base/template.dart';
import '../page/content/shop_page.dart';
import '../page/forgot_password_page.dart';
import '../page/getstarted_page.dart';
import '../page/signup_page.dart';
import '../provider/home/banner_provider.dart';
import '../provider/home/home_provider.dart';
import '../provider/template_provider.dart';
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
        ChangeNotifierProvider(create: (_) => TemplateProvider()),
        ChangeNotifierProvider(create: (_) => SplashscreenProv()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),          
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
        AppRoutes.home: (context) => const Template(),
        AppRoutes.splash: (context) => const SplashscreenPage(),
        AppRoutes.splashIntro: (context) => const SplashIntro(),
        AppRoutes.signin: (context) => const SiginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
        AppRoutes.forgotpassword: (context) => const ForgotPasswordPage(),
        AppRoutes.getstarted: (context) => const GetstartedPage(),
        AppRoutes.shop: (context) => const ShopPage(),
        AppRoutes.checkOut: (context) => CheckoutPage(),
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
  static const shop = "/shop";
  static const checkOut = "/checkout";
}
