// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/main.dart';
import 'package:hitam_market/theme/app_colors.dart';

class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: _appBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _header(context),
              const Gap(54),
              _applyKupon(),
              const Gap(16),
              _isiContent(),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          height: 146,
          decoration: BoxDecoration(
            color: AppColors.bottomSheet,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            border: Border.all(color: AppColors.strokefill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹299.43',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View Details',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.checkOut),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _isiContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey.shade300, thickness: 1, height: 32),
        const Gap(16),
        Text(
          'Order Payment Details',
          style: GoogleFonts.montserrat(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(26),
        Row(
          children: [
            Text(
              'Order Amounts',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              '₹299.43',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            Text(
              'Convenience',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(14),
            Text(
              'Know More',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              'Apply Coupon',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              'Free',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
        const Gap(16),
        Divider(color: Colors.grey.shade300, thickness: 1, height: 32),
        const Gap(16),
        Row(
          children: [
            Text(
              'Order Total',
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              '₹299.43',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            Text(
              'EMI Available',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(14),
            Text(
              'Details',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _applyKupon() {
    return Row(
      children: [
        const Gap(5),
        SvgPicture.asset('assets/svgs/kupon.svg', color: AppColors.textPrimary),
        const Gap(10),
        Text(
          'Apply Coupons',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () {
            // action
          },
          child: Text(
            'Select',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Gap(5),
        Container(
          height: 153,
          width: 123,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: const DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(21),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nike Air Max 270 React ENG SE ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Gap(8),
                Text(
                  'Checked Single-Breasted Blazer Checked Single-Breasted Blazer vChecked Single-Breasted Blazer',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdown(
                        label: 'Size',
                        value: '42',
                        onTap: () => _showSizeSheet(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomDropdown(
                        label: 'Qty',
                        value: '1',
                        onTap: () => _showQtySheet(context),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    Text(
                      'Delivery by ',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '10 May 2XXX',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showSizeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        final sizes = ['38', '39', '40', '41', '42', '43'];

        return ListView(
          padding: const EdgeInsets.all(16),
          children: sizes.map((size) {
            return ListTile(
              title: Text(size),
              onTap: () {
                // update state/provider
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showQtySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        final sizes = ['1', '2', '3', '4', '5', '6'];

        return ListView(
          padding: const EdgeInsets.all(16),
          children: sizes.map((size) {
            return ListTile(
              title: Text(size),
              onTap: () {
                // update state/provider
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.bgcolor,
      // 🔥 PENTING
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Shopping Bag',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SvgPicture.asset(
                        'assets/svgs/heart.svg',
                        color: AppColors.textPrimary,
                      ),
                    ),
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

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(12),
                Text(
                  value,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }
}
