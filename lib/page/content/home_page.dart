// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../model/dealofdayModel.dart';
import '../../model/trendingproductsModel.dart';
import '../../provider/home/banner_provider.dart';
import '../../theme/app_colors.dart';
import '../../widget/dealofday_widget.dart';
import '../../widget/trending_products_widget copy.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bannerPages = [
      bannerPageOne(),
      bannerPageTwo(),
      bannerPageThree(),
    ];
    final List<DealOfDayModel> dummyDealOfDay = [
      DealOfDayModel(
        image: 'assets/images/1.jpg',
        title: 'Women Printed Kurtav afafasfasfsafas',
        description: 'Comfortable cotton kurta for daily wear safsaassaasasfa',
        price: 1500,
        originalPrice: 2500,
        discount: 40,
        rating: 4.5,
        totalReview: 1212,
      ),
      DealOfDayModel(
        image: 'assets/images/2.jpg',
        title: 'Men Casual Shirt asfasfafasfafafafasfasfa',
        description: 'Slim fit casual shirtcasccascsacascascasacaaca',
        price: 1200,
        originalPrice: 2000,
        discount: 35,
        rating: 4.2,
        totalReview: 845,
      ),
      DealOfDayModel(
        image: 'assets/images/3.jpg',
        title: 'Leather Handbag fasfsaasfasfafssafasfasf',
        description: 'Premium leather handbag casca sc asc as ascasa a',
        price: 3200,
        originalPrice: 5000,
        discount: 36,
        rating: 4.8,
        totalReview: 532,
      ),
    ];
    final List<TrendingproductsModel> dummyTrendingProducts = [
      TrendingproductsModel(
        image: 'assets/images/1.jpg',
        title: 'Women Printed Kurtav afafasfasfsafas',
        description: 'Comfortable cotton kurta for daily wear safsaassaasasfa',
        price: 1500,
        originalPrice: 2500,
        discount: 40,
      ),
      TrendingproductsModel(
        image: 'assets/images/2.jpg',
        title: 'Men Casual Shirt asfasfafasfafafafasfasfa',
        description: 'Slim fit casual shirtcasccascsacascascasacaaca',
        price: 1200,
        originalPrice: 2000,
        discount: 35,
      ),
      TrendingproductsModel(
        image: 'assets/images/3.jpg',
        title: 'Leather Handbag fasfsaasfasfafssafasfasf',
        description: 'Premium leather handbag casca sc asc as ascasa a',
        price: 3200,
        originalPrice: 5000,
        discount: 36,
      ),
    ];

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
              _listBarang(),
              const Gap(16),
              _banner(context, bannerPages),
              const Gap(12),
              _bannerDots(context, bannerPages.length),
              const Gap(16),
              _dealOfDay(),
              const Gap(16),
              _listDealOfTheDay(dummyDealOfDay),
              const Gap(16),
              _specialOffers(),
              const Gap(16),
              _flatnheels(),
              const Gap(16),
              _trendingProducts(),
              const Gap(16),
              _listTrendingProducts(dummyTrendingProducts),
              const Gap(16),
              _newArrivals(),
              const Gap(16),
              _sponserd(),
            ],
          ),
        ),
      ),
    );
  }

  Container _sponserd() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Sponserd',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/image12.png',
                cacheWidth: 800, // Optimasi: Resize gambar ke memori
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'up to 50% Off',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }

  Container _newArrivals() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgcolor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              'assets/images/image10.png',
              cacheWidth: 800, // Optimasi: Resize gambar ke memori
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Arrivals',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      "Summer’ 25 Collections",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  height: 32,
                  child: Material(
                    color: Colors.transparent,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: AppColors.primary,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: AppColors.bgcolor,
                          width: 1,
                        ),
                      ),
                      label: Text(
                        "View all",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.bgcolor,
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.bgcolor,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(16),
        ],
      ),
    );
  }

  Widget _listTrendingProducts(
    List<TrendingproductsModel> dummyTrendingProducts,
  ) {
    final ScrollController scrollController = ScrollController();

    const double itemWidth = 170; // samakan dengan width DealofdayWidget
    const double itemGap = 12;
    final double scrollOffset = itemWidth + itemGap;

    return SizedBox(
      height: 228,
      child: Stack(
        children: [
          // LIST
          ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TrendingproductsWidget(data: dummyTrendingProducts[index]);
            },
            separatorBuilder: (context, index) => const Gap(itemGap),
            itemCount: dummyTrendingProducts.length,
          ),

          // FLOATING BUTTON KANAN (RADIAL 3D)
          Positioned(
            right: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  scrollController.animateTo(
                    scrollController.offset + scrollOffset,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    // 🌈 RADIAL GRADIENT (ISI BUTTON)
                    gradient: RadialGradient(
                      center: const Alignment(
                        -0.3,
                        -0.3,
                      ), // cahaya dari kiri atas
                      radius: 0.9,
                      colors: [
                        Colors.white,
                        AppColors.texthint2.withOpacity(0.9),
                        AppColors.texthint2,
                      ],
                      // stops: const [0.25, 0.6, 1.0],
                    ),

                    // ☁️ SHADOW (FLOATING)
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  // ✨ EDGE / HIGHLIGHT (EFEK 3D)
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 0.8,
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _trendingProducts() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.pinks,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trending Products",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.bgcolor,
                  ),
                ),
                const Gap(4),
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/calender.svg'),
                    const Gap(4),
                    Text(
                      "Last Date 29/02/22",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: AppColors.bgcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(4),
                ),
                side: BorderSide(color: AppColors.bgcolor, width: 1),
              ),
              label: Text(
                "View all",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bgfill,
                ),
              ),
              icon: Icon(Icons.arrow_forward, color: AppColors.bgcolor),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _flatnheels() {
    return SizedBox(
      height: 172,
      width: double.infinity,
      child: Stack(
        children: [
          // CONTAINER UTAMA (TIDAK DIUBAH STRUKTURNYA)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.bgcolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 4, top: 8, bottom: 8),
              child: Container(
                color: AppColors.sobgfill.withOpacity(0.3),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/starmany.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 16,
                      child: SizedBox(
                        width: 280,
                        child: Image.asset(
                          'assets/images/banner/chisa.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 43,
                      right: 16,
                      child: Column(
                        children: [
                          Text(
                            'Flat and Heels',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Stand a chance to get rewarded',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const Gap(16),
                          SizedBox(
                            height: 32,
                            child: Material(
                              color: Colors.transparent,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  backgroundColor: AppColors.primary,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.bgcolor,
                                    width: 1,
                                  ),
                                ),
                                label: Text(
                                  "Visit now",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.bgcolor,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.bgcolor,
                                ),
                                iconAlignment: IconAlignment.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // BORDER GRADIENT KIRI (OVERLAY)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 11,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFEFAD18), Color(0xFFF8D7B4)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _specialOffers() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgcolor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/specialoffer.png', width: 75, height: 60),
          const Gap(24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Special Offers",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(8),
                    Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(64),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(color: AppColors.icon, width: 1),
                      ),
                      child: Text(
                        '😱',
                        style: GoogleFonts.arimo(fontSize: 10.5),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Text(
                  'We make sure you get the\noffer you need at best prices',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listDealOfTheDay(List<DealOfDayModel> dummyDealOfDay) {
    final ScrollController scrollController = ScrollController();

    const double itemWidth = 170; // samakan dengan width DealofdayWidget
    const double itemGap = 12;
    final double scrollOffset = itemWidth + itemGap;

    return SizedBox(
      height: 248,
      child: Stack(
        children: [
          // LIST
          ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DealofdayWidget(data: dummyDealOfDay[index]);
            },
            separatorBuilder: (context, index) => const Gap(itemGap),
            itemCount: dummyDealOfDay.length,
          ),

          // FLOATING BUTTON KANAN (RADIAL 3D)
          Positioned(
            right: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  scrollController.animateTo(
                    scrollController.offset + scrollOffset,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    // 🌈 RADIAL GRADIENT (ISI BUTTON)
                    gradient: RadialGradient(
                      center: const Alignment(
                        -0.3,
                        -0.3,
                      ), // cahaya dari kiri atas
                      radius: 0.9,
                      colors: [
                        Colors.white,
                        AppColors.texthint2.withOpacity(0.9),
                        AppColors.texthint2,
                      ],
                      // stops: const [0.25, 0.6, 1.0],
                    ),

                    // ☁️ SHADOW (FLOATING)
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  // ✨ EDGE / HIGHLIGHT (EFEK 3D)
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 0.8,
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _dealOfDay() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.fouthbgfill,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deal of the Day',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.bgcolor,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/clock.svg'),
                    const Gap(4),
                    Text(
                      '22h 55m 20s remaining',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: AppColors.bgcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(4),
                ),
                side: BorderSide(color: AppColors.bgcolor, width: 1),
              ),
              label: Text(
                "View all",
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bgfill,
                ),
              ),
              icon: Icon(Icons.arrow_forward, color: AppColors.bgcolor),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _banner(BuildContext context, List<Widget> bannerPages) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 189,
        child: PageView(
          onPageChanged: (value) {
            context.read<BannerProvider>().setCurrentIndex(value);
          },
          children: bannerPages,
        ),
      ),
    );
  }

  Container _listBarang() {
    final List<Map<String, String>> categories = [
      {'title': 'Beauty', 'image': 'assets/images/1.jpg'},
      {'title': 'Fashion', 'image': 'assets/images/2.jpg'},
      {'title': 'Food', 'image': 'assets/images/3.jpg'},
      {'title': 'Kids', 'image': 'assets/images/4.jpg'},
      {'title': 'Mens', 'image': 'assets/images/2.jpg'},
      {'title': 'Womens', 'image': 'assets/images/4.jpg'},
      {'title': 'Otakus', 'image': 'assets/images/1.jpg'},
    ];

    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white, // warna field
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // intensitas shadow
            blurRadius: 10,
            offset: const Offset(0, 0), // arah bayangan
          ),
        ],
      ),
      height: 87,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Center(
            child: SizedBox(
              width: 56,
              height: 71,
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(category['image']!).image,
                      ),
                    ),
                  ),
                  Text(
                    category['title']!,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(16),
        itemCount: categories.length,
      ),
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
              "All Featured",
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

  //Banner Page
  Widget bannerPageOne() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/banner/banner1.jpg',
          fit: BoxFit.cover,
          cacheWidth:
              1000, // Optimasi: Jangan load resolusi penuh jika file besar
        ),

        // Overlay gelap
        Container(color: Colors.black.withOpacity(0.3)),

        Positioned(
          top: 24,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "PROMO BESAR!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Diskon sampai 50%", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),

        Positioned(
          top: 20,
          right: 5,
          child: SizedBox(
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/images/banner/chisa.png'),
            ),
          ),
        ),

        Positioned(
          bottom: 16,
          left: 16,
          child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.bgfill,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: AppColors.primaryLight.withOpacity(0.8),
                      width: 2,
                    ),
                  ),
                ).copyWith(
                  shadowColor: MaterialStateProperty.all(
                    Colors.black.withOpacity(0.3),
                  ),
                ),
            onPressed: () {},
            child: const Text(
              'Lihat Promo',
              style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget bannerPageTwo() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/banner/banner2.jpg',
          fit: BoxFit.cover,
          cacheWidth: 1000, // Optimasi
        ),

        Container(color: Colors.black.withOpacity(0.25)),

        Positioned(
          top: 20,
          left: 16,
          child: const Text(
            "🔥 Produk Trending",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Positioned(
          top: 10,
          right: -20,
          child: SizedBox(
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/images/banner/chisa2.png'),
            ),
          ),
        ),

        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Row(
            children: [
              _trendChip("Skincare"),
              const SizedBox(width: 8),
              _trendChip("Fashion"),
              const SizedBox(width: 8),
              _trendChip("Gadget"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _trendChip(String text, {VoidCallback? onTap}) {
    return Material(
      color: AppColors.primaryLight.withOpacity(0.75),
      borderRadius: BorderRadius.circular(20),
      elevation: 3,
      shadowColor: AppColors.secondaryDots,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget bannerPageThree() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/banner/banner3.jpg',
          fit: BoxFit.cover,
          cacheWidth: 1000, // Optimasi
        ),

        Container(color: Colors.black.withOpacity(0.35)),

        Positioned(
          top: 10,
          left: -50,
          child: SizedBox(
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/images/banner/changli.png'),
            ),
          ),
        ),

        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Jadi Member Sekarang",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Dapatkan cashback & promo eksklusif",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [AppColors.bgfill, AppColors.primaryLight],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Join Sekarang',
                style: TextStyle(
                  color: AppColors.secondaryDots,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bannerDots(BuildContext context, int total) {
    return Consumer<BannerProvider>(
      builder: (context, prov, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(total, (index) {
            final isActive = index == prov.currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.dots
                    : AppColors.dots.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        );
      },
    );
  }
}
