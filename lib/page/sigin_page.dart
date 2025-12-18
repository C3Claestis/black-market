// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../provider/password_visibility_prov.dart';
import '../theme/app_colors.dart';
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
              _title(),
              const Gap(36),
              _usernameInput(),
              const Gap(31),
              _passInput(),
              const Gap(9),
              _forgotPass(context),
              const Gap(52),
              _btnLogin(context),
              const Gap(75),
              _txtOr(),
              const Gap(20),
              _trioLogin(),
              const Gap(28),
              _signUp(context),
            ],
          ),
        ),
      ),
    );
  }

  Row _signUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Create An Account ",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            children: [
              TextSpan(
                text: "Sign Up",
                style: GoogleFonts.montserrat(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushNamed(context, AppRoutes.signup);
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

  SizedBox _btnLogin(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.getstarted);
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          "Login",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container _forgotPass(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.forgotpassword);
        },
        child: Text(
          "Forgot Password?",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
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
      "Welcome\nBack!",
      style: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }
}
