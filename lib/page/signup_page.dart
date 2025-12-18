// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/provider/password_visibility_prov.dart';
import 'package:hitam_market/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../base/template.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
              const Gap(36),
              _usernameInput(),
              const Gap(31),
              _passInput(),
              const Gap(31),
              _confirmPassInput(),
              const Gap(19),
              _terms(),
              const Gap(38),
              _btnCreate(),
              const Gap(40),
              _txtOr(),
              const Gap(20),
              _trioLogin(),
              const Gap(28),
              _login(context),
            ],
          ),
        ),
      ),
    );
  }

  RichText _terms() {
    return RichText(
      text: TextSpan(
        text: "By clicking the ",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textHint,
        ),
        children: [
          TextSpan(
            text: "Register",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
            children: [
              TextSpan(
                text: " button, you agree\nto the public offer ",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _login(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "I Already Have an Account ",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            children: [
              TextSpan(
                text: "Login",
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _trioLogin() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondarybgfill.withOpacity(.15),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondarybgfill.withOpacity(.15),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset('assets/svgs/apple.svg'),
                ),
              ),
            ),
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondarybgfill.withOpacity(.15),
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset('assets/svgs/facebook.svg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _txtOr() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        textAlign: TextAlign.center,
        "- OR Continue with -",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  SizedBox _btnCreate() {
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
          "Create Account",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Consumer<PasswordVisibilityProvider> _passInput() {
    return Consumer<PasswordVisibilityProvider>(
      builder: (context, prov, _) => TextField(
        obscureText: !prov.isVisible,
        style: GoogleFonts.montserrat(),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 11, right: 0),
            child: Icon(Icons.lock, color: AppColors.icon, size: 24),
          ),
          fillColor: AppColors.bgfill,
          filled: true,
          suffixIcon: GestureDetector(
            onTap: prov.toggleVisibility,
            child: Icon(
              prov.isVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.icon,
              size: 24,
            ),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.strokefill, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Password",
          hintStyle: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textHint,
          ),
        ),
      ),
    );
  }

  Consumer<PasswordVisibilityProvider> _confirmPassInput() {
    return Consumer<PasswordVisibilityProvider>(
      builder: (context, prov, _) => TextField(
        obscureText: !prov.isVisible,
        style: GoogleFonts.montserrat(),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 11, right: 0),
            child: Icon(Icons.lock, color: AppColors.icon, size: 24),
          ),
          fillColor: AppColors.bgfill,
          filled: true,
          suffixIcon: GestureDetector(
            onTap: prov.toggleVisibility,
            child: Icon(
              prov.isVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.icon,
              size: 24,
            ),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.strokefill, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Confirm Password",
          hintStyle: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textHint,
          ),
        ),
      ),
    );
  }

  TextField _usernameInput() {
    return TextField(
      style: GoogleFonts.montserrat(),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 11, right: 0),
          child: Icon(Icons.person, color: AppColors.icon, size: 24),
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
    );
  }

  Text _title() {
    return Text(
      "Create an\naccount",
      style: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }
}
