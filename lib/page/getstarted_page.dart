// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/base/template.dart';
import 'package:hitam_market/provider/onboarding_provider.dart';
import 'package:hitam_market/widget/OnboardingItem_widget.dart';
import 'package:provider/provider.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

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
                                color: const Color(0xFFA0A0A1),
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
                    onPressed: prov.prevPage,
                    child: Text(
                      "Prev",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFC4C4C4),
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
                            width: value.currentIndex == index ? 20 : 8,
                            decoration: BoxDecoration(
                              color: value.currentIndex == index
                                  ? const Color(0xFFF83758)
                                  : const Color(0xFFC4C4C4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  TextButton(
                    onPressed: prov.nextPage,
                    child: Text(
                      "Next",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF83758),
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
