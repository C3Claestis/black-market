// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/main.dart';
import 'package:hitam_market/model/dataModel.dart';
import 'package:hitam_market/provider/shop/gambar_slider_provider.dart';
import 'package:hitam_market/provider/shop/select_size_provider.dart';
import 'package:hitam_market/theme/app_colors.dart';
import 'package:hitam_market/widget/list_model_widget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    String sizeStr = 'Size: ';

    final List<String> images = [
      'assets/images/5.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/4.jpg',
    ];

    final sizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GambarSliderProvider()),
        ChangeNotifierProvider(create: (_) => SelectSizeProvider(sizes.first)),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isiContent(_pageController, images, sizeStr, sizes, context),
                const Gap(16),
                _rowTwoBtnOptions(),
                const Gap(20),
                _footerSimilarContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _isiContent(
    PageController _pageController,
    List<String> images,
    String sizeStr,
    List<String> sizes,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          _imgProduct(_pageController, images),
          const Gap(16),
          _sizeTxt(sizeStr),
          const Gap(12),
          _btnSize(sizes),
          const Gap(16),
          _tittleProduct(),
          _subtittleProduct(),
          const Gap(4),
          _ratingProduct(),
          const Gap(4),
          _pricendiscountProduct(),
          const Gap(4),
          _detailProduct(),
          const Gap(12),
          _rowBtncolor(context),
          const Gap(12),
          _delivery(),
        ],
      ),
    );
  }

  Padding _footerSimilarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar To',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          _allFitur(),
          const Gap(16),
          _listSimilar(Datamodel.dummyDataModel),
          const Gap(16),
        ],
      ),
    );
  }

  Widget _listSimilar(List<Datamodel> dummyDealOfDay) {
    return SizedBox(
      height: 228,
      child:
          // LIST
          ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListModelWidget(
                data: dummyDealOfDay[index],
                isDealOfDay: false,
              );
            },
            separatorBuilder: (context, index) => const Gap(12),
            itemCount: dummyDealOfDay.length,
          ),
    );
  }

  SizedBox _allFitur() {
    return SizedBox(
      width: double.infinity,
      height: 32,
      child: Row(
        children: [
          Text(
            "282+ Items ",
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 6),
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
          ),
        ],
      ),
    );
  }

  Row _rowTwoBtnOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _btnTwoOptions('View Similar', 'eye'),
        const Gap(6),
        _btnTwoOptions('Add to Compare', 'compare'),
      ],
    );
  }

  Expanded _btnTwoOptions(String text, String icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.bgcolor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.strokefill, width: 0.75),
          ),
          child: Row(
            children: [
              const Gap(12),
              SvgPicture.asset('assets/svgs/${icon}.svg'),
              const Gap(8),
              Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _delivery() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.deliveryBg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 26, top: 11, bottom: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery in',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1,
              ),
            ),
            Text(
              '1 within Hour',
              style: GoogleFonts.montserrat(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _rowBtncolor(BuildContext context) {
    return Row(
      children: [
        _btnCollor(
          'Go to cart',
          'cart',
          Color(0xFF3F92FF),
          Color(0xFF0B3689),
          context,
        ),
        const Gap(8),
        _btnCollor(
          'Buy Now',
          'touch',
          Color(0xFF71F9A9),
          Color(0xFF31B769),
          context,
        ),
      ],
    );
  }

  Widget _btnCollor(
    String text,
    String icon,
    Color color1,
    Color color2,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.checkOut);
      },
      child: SizedBox(
        width: 136,
        height: 40,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: 115,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color1, // 0%
                    color2, // 100%
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Center(
                  child: Text(
                    text,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.bgcolor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.6,
                    colors: [
                      color1, // 0% (tengah)
                      color2, // 100% (luar)
                    ],
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/${icon}.svg',
                    width: 24,
                    height: 24,
                    color: AppColors.bgcolor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _detailProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Details',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        ReadMoreText(
          'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ',
          trimLines: 5,
          textAlign: TextAlign.justify,
          trimCollapsedText: 'More',
          trimExpandedText: 'Less',
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: AppColors.textPrimary,
          ),
          moreStyle: GoogleFonts.montserrat(
            fontSize: 12,
            color: AppColors.secondarybgfill,
          ),
          lessStyle: GoogleFonts.montserrat(
            fontSize: 12,
            color: AppColors.secondarybgfill,
          ),
        ),
        const Gap(8),
        Row(
          children: [
            _btnProductDetail("Nearest Store", "maps"),
            const Gap(8),
            _btnProductDetail("VIP", "lock"),
            const Gap(8),
            _btnProductDetail("Return policy", "returnpoli"),
          ],
        ),
      ],
    );
  }

  TextButton _btnProductDetail(String text, String icon) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.all(4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(color: AppColors.strokefill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/svgs/${icon}.svg', width: 12),
          const Gap(4),
          Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textbtnshop,
            ),
          ),
        ],
      ),
    );
  }

  Row _pricendiscountProduct() {
    return Row(
      children: [
        Text(
          "₹3,000",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.textprice,
            decoration: TextDecoration.lineThrough,
            height: 1.6,
          ),
        ),
        const Gap(8),
        Text(
          "₹1,500",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),
        const Gap(8),
        Text(
          "50% Off",
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.secondarybgfill,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Row _ratingProduct() {
    return Row(
      children: [
        ...List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: SvgPicture.asset(
              index < 4 ? 'assets/svgs/star.svg' : 'assets/svgs/starmin.svg',
              width: 18,
              height: 18,
            ),
          );
        }),
        const Gap(4),
        Text(
          '442,222',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: AppColors.textprice,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Text _subtittleProduct() {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      "Vision Alta Men’s Shoes Size (All Colours)",
      style: GoogleFonts.montserrat(fontSize: 14, color: AppColors.textPrimary),
    );
  }

  Text _tittleProduct() {
    return Text(
      "Chisa Full Set",
      style: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  Wrap _btnSize(List<String> sizes) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: sizes.map((size) => _sizeBtn(size)).toList(),
    );
  }

  Consumer<SelectSizeProvider> _sizeTxt(String sizeStr) {
    return Consumer<SelectSizeProvider>(
      builder: (context, value, child) => Text(
        '$sizeStr${value.selectedSize}',
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _sizeBtn(String size) {
    return Consumer<SelectSizeProvider>(
      builder: (context, value, child) => TextButton(
        onPressed: () {
          return value.selectSize(size);
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(8),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: value.selectedSize == size
              ? AppColors.primary
              : AppColors.bgcolor,
          side: BorderSide(
            color: value.selectedSize == size
                ? Colors.transparent
                : AppColors.secondarybgfill,
            width: 2,
          ),
        ),
        child: Text(
          size,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: value.selectedSize == size
                ? AppColors.bgcolor
                : AppColors.secondarybgfill,
          ),
        ),
      ),
    );
  }

  Consumer<GambarSliderProvider> _imgProduct(
    PageController _pageController,
    List<String> images,
  ) {
    return Consumer<GambarSliderProvider>(
      builder: (context, sliderProv, _) {
        return Column(
          children: [
            // ===== SLIDER =====
            SizedBox(
              height: 213,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: sliderProv.setIndex,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),

                  // ===== BUTTON NEXT =====
                  Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          sliderProv.nextPage(images.length);
                          _pageController.animateToPage(
                            sliderProv.currentIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        child: _nextButton(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            // ===== DOTS =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: sliderProv.currentIndex == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: sliderProv.currentIndex == index
                        ? AppColors.primary
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _nextButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: const Alignment(-0.3, -0.3),
          radius: 0.9,
          colors: [
            Colors.white,
            AppColors.texthint2.withOpacity(0.9),
            AppColors.texthint2,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.chevron_right, size: 26, color: Colors.black87),
    );
  }
}
