import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;

  const Template({super.key, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body, bottomNavigationBar: bottomNavigationBar);
  }
}
