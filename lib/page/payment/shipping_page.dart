// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/theme/app_colors.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: _appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Divider(color: AppColors.strokefill.withOpacity(.2), thickness: 1),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Order',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: AppColors.strokefill,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        '₹3,000',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.strokefill,
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  Row(
                    children: [
                      Text(
                        'Shipping',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: AppColors.strokefill,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        '₹50',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.strokefill,
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        '₹3,050',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  Divider(color: AppColors.textPrimary, thickness: 1),
                  const Gap(18),
                  Text(
                    'Payment',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Gap(18),
                  _paymentBtn('assets/images/visa.png'),
                  const Gap(25),
                  _paymentBtn('assets/images/paypal.png'),
                  const Gap(25),
                  _paymentBtn('assets/images/maestro.png'),
                  const Gap(25),
                  _paymentBtn('assets/images/apple.png'),
                  const Gap(25),
                  _btnSubmit(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _btnSubmit(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () => _showPaymentSuccess(context),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          "Continue",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  GestureDetector _paymentBtn(String path) {
    return GestureDetector(
      onTap: () {
        // Handle payment method selection
      },
      child: SizedBox(
        width: double.infinity,
        height: 59,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgfill,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(path, width: 50, height: 50),
                const Gap(12),
                Text(
                  maskPhone('08812554242'),
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.strokefill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String maskPhone(String phone) {
    if (phone.length <= 4) return phone;
    return '*' * (phone.length - 4) + phone.substring(phone.length - 4);
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.bgcolor,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,

      // 🔹 BACK BUTTON KIRI
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.textPrimary,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      // 🔹 TITLE BENAR-BENAR TENGAH
      title: Text(
        'Checkout',
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  void _showPaymentSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ===== ICON SUCCESS =====
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(child: _dot(size: 8), left: 50, top: -15),
                      Positioned(child: _dot(size: 12), right: -25, top: 25),
                      Positioned(child: _dot(size: 12), left: -40, top: 5),
                      Positioned(child: _dot(size: 8), left: -30, top: 40),
                      Positioned(child: _dot(size: 11), left: -25, bottom: 0),
                      Positioned(child: _dot(size: 8), right: 0, bottom: 17),

                      // Main badge
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bgc.png'),
                          ),
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const Gap(28),

                  // ===== TEXT =====
                  Text(
                    'Payment done successfully.',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dot({double size = 10}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withOpacity(.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
