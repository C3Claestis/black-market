// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/model/wishlistModel.dart';
import 'package:hitam_market/data/wishlist_dummy_data.dart';
import 'package:hitam_market/theme/app_colors.dart';
import 'package:hitam_market/widget/wishlist_widget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _srchBar(),
              const Gap(16),
              _allFitur(),
              const Gap(16),
              _listLargeWishlist(dummyLargeWishlist),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listLargeWishlist(List<WishListmodel> dummyWishlist) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummyWishlist.length,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final bool isleftTall = (index ~/ 2) % 2 == 0
            ? index % 2 == 1
            : index % 2 == 0;
        return SizedBox(
          height: isleftTall ? 305 : 245,
          child: WishlistWidget(data: dummyWishlist[index]),
        );
      },
    );
  }

  Padding _allFitur() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: double.infinity,
        height: 32,
        child: Row(
          children: [
            Text(
              "52,082+ Iteams ",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        "Sort",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        'assets/svgs/updown.svg',
                        width: 16,
                        height: 16,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        "Filter",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: SvgPicture.asset(
                        'assets/svgs/filter.svg',
                        width: 16,
                        height: 16,
                      ),
                      iconAlignment: IconAlignment.end,
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

  Container _srchBar() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white, // warna field
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // intensitas shadow
            blurRadius: 10,
            offset: const Offset(0, 0), // arah bayangan
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search any Product..',
          hintStyle: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.texthint2,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(Icons.search, size: 20, color: AppColors.texthint2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(
            Icons.mic_none_sharp,
            size: 24,
            color: AppColors.texthint2,
          ),
        ),
      ),
    );
  }
}
