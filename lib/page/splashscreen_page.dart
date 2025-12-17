import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/splashscreen_prov.dart';
import '../base/template.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashscreenProv>().startTimer(context);
    });
    
    return Template(body: Center(child: Image.asset('assets/images/logo.png')));
  }
}
