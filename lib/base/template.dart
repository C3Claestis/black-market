import 'package:flutter/material.dart';
import 'package:hitam_market/theme/app_colors.dart';

class Template extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;

  const Template({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
