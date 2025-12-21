// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/main.dart';
import 'package:hitam_market/theme/app_colors.dart';
import '../base/template.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // BAR PUTIH
        statusBarIconBrightness: Brightness.light, // ICON HITAM (Android)
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: Template(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // STATUS BAR BACKGROUND
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).padding.top,
                child: Container(color: Colors.white),
              ),         
              _bg(),
              _shading(),            
              _isiContent(context),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _isiContent(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "You want\nAuthentic, here\nyou go!",
                style: GoogleFonts.montserrat(
                  fontSize: 34,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1 / 100,
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Find it here, buy it now!",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(16),
            _btnGetStarted(context),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Align _shading() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: constraints.maxHeight * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(.7),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Positioned _bg() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg.png',
        fit: BoxFit.cover, // ⬅️ penting
      ),
    );
  }

  SizedBox _btnGetStarted(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Get Started",
          style: GoogleFonts.montserrat(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
