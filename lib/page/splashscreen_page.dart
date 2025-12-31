import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/splashscreen_prov.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashscreenProv>().startTimer(context);
    });
    
    return Scaffold(      
      body: Center(child: Image.asset('assets/images/logo.png')));
  }
}
