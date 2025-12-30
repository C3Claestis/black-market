// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/model/DealOfDayModel.dart';
import 'package:hitam_market/theme/app_colors.dart';

class DealofdayWidget extends StatelessWidget {
  final DealOfDayModel data;
  const DealofdayWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE (tanpa padding)
            AspectRatio(
              aspectRatio: 14 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  data.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // CONTENT (padding 4 untuk semuanya)
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(4),
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.textPrimary,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    data.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    "₹${data.price.toString()}",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.textPrimary,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${data.originalPrice.toString()}",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.textprice,
                          decoration: TextDecoration.lineThrough,
                          height: 1.6,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        data.discount.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.error,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: SvgPicture.asset(
                            index < data.rating.floor()
                                ? 'assets/svgs/star.svg'
                                : 'assets/svgs/starmin.svg',
                          ),
                        );
                      }),
                      const Gap(4),
                      Text(
                        data.totalReview.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppColors.textprice,
                          height: 1.6,
                        ),
                      ),
                    ],
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
