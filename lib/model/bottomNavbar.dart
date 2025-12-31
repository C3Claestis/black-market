// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/theme/app_colors.dart';

class Bottomnavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Bottomnavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.bgcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(0, 'assets/svgs/home.svg', 'Home'),
          _navItem(1, 'assets/svgs/heart.svg', 'Wishlist'),
          SizedBox(width: 60, height: 60),
          _navItem(2, 'assets/svgs/search.svg', 'Search'),
          _navItem(3, 'assets/svgs/settings.svg', 'Setting'),
        ],
      ),
    );
  }

  Widget _navItem(int index, String iconPath, String label) {
    bool isActive = currentIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14, top: 11),      
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // <— AREA KLIK LEBAR
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 26,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive ? AppColors.primaryDark : AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(iconPath, width: 24, height: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
              child: Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: isActive
                      ? AppColors.primaryDark
                      : AppColors.textPrimary,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
