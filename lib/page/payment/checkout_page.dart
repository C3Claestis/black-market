// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/main.dart';
import 'package:hitam_market/theme/app_colors.dart';
import 'package:hitam_market/widget/checkout_card_widget.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: _appBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: AppColors.strokefill.withOpacity(.2), thickness: 1),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(18),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/pointer.svg'),
                      const Gap(8),
                      Text(
                        'Delivery Address',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 280,
                          minWidth: 241,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgcolor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                offset: Offset(0, -2), // atas
                                blurRadius: 4,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                offset: Offset(0, 2), // bawah
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address :',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      "216 St Paul's Rd, London N1 2LL, UK.\nContact :  +44-784232",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        color: AppColors.textPrimary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/svgs/edit.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(12),
                      Container(
                        height: 79,
                        width: 79,
                        decoration: BoxDecoration(
                          color: AppColors.bgcolor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              offset: Offset(0, -2), // atas
                              blurRadius: 4,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              offset: Offset(0, 2), // bawah
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            size: 32,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  Text(
                    'Shopping List',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Scrollbar(
                  controller: controller,
                  thumbVisibility: true,
                  radius: const Radius.circular(8),
                  interactive: true,
                  thickness: 6,
                  child: ListView.separated(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CheckoutCardWidget();
                    },
                    separatorBuilder: (context, index) => const Gap(12),
                    itemCount: 10,
                  ),
                ),
              ),
            ),
            const Gap(24),
            // ===== BUTTON (FIXED BOTTOM) =====
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.shipping),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Proceed to Payment',
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.bgcolor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
