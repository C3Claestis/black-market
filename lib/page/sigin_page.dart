import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/theme/app_colors.dart';
import '../base/template.dart';

class SiginPage extends StatelessWidget {
  const SiginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome\nBack!",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              const Gap(36),

              TextField(
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(                        
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 11, right: 0),
                    child: Icon(Icons.person, color: AppColors.icon),
                  ),            
                  fillColor: AppColors.bgfill,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.strokefill, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Username or Email",                  
                  hintStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textHint,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
