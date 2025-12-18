// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../base/template.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              const Gap(31),
              _userInput(),
              const Gap(26),
              _terms(),
              const Gap(26),
              _btnSubmit(),
              const Gap(75),
            ],
          ),
        ),
      ),
    );
  }

  RichText _terms() {
    return RichText(
      text: TextSpan(
        text: "*",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryDark,
        ),
        children: [
          TextSpan(
            text:
                " We will send you a message to set or reset\nyour new password\n",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _btnSubmit() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Submit",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TextField _userInput() {
    return TextField(
      style: GoogleFonts.montserrat(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 11, right: 0),
          child: Icon(Icons.mail, color: AppColors.icon, size: 24),
        ),
        fillColor: AppColors.bgfill,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.strokefill, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Enter your email address",
        hintStyle: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textHint,
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      "Forgot\npassword!",
      style: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }
}
