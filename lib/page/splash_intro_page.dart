// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../base/template.dart';
import '../theme/app_colors.dart';
import '../provider/onboarding_provider.dart';
import '../widget/OnboardingItem_widget.dart';

class SplashIntro extends StatelessWidget {
  const SplashIntro({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Tetap dipertahankan
    final prov = context.watch<OnboardingProvider>();

    return Template(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// 🔹 HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<OnboardingProvider>(
                    builder: (_, value, __) {
                      return RichText(
                        text: TextSpan(
                          text: "${value.currentIndex + 1}",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "/${onboardingData.length}",
                              style: GoogleFonts.montserrat(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 SLIDER
            Expanded(
              child: PageView.builder(
                controller: prov.pageController,
                onPageChanged: prov.onPageChanged,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.image),
                        const Gap(20),
                        Text(
                          item.title,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Gap(10),
                        Text(item.description, textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// 🔹 FOOTER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (prov.currentIndex == 0) ? null : prov.prevPage,
                    child: Text(
                      (prov.currentIndex == 0) ? "" : "Prev",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),

                  /// 🔹 DOTS
                  Consumer<OnboardingProvider>(
                    builder: (_, value, __) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: value.currentIndex == index ? 40 : 8,
                            decoration: BoxDecoration(
                              color: value.currentIndex == index
                                  ? AppColors.secondaryDots
                                  : AppColors.textSecondary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  TextButton(
                    onPressed: () => (prov.currentIndex == 2)
                        ? prov.goSigninPage(context)
                        : prov.nextPage(context),

                    child: Text(
                      (prov.currentIndex == 2) ? "Get Started" : "Next",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
