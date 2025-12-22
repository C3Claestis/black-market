// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitam_market/base/template.dart';
import 'package:hitam_market/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bannerPages = [
      bannerPageOne(),
      bannerPageTwo(),
      bannerPageThree(),
    ];

    return Template(
      appBar: _appBar(),
      body: SafeArea(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 189,
                    child: PageView(children: bannerPages),
                  ),
                ),
              ],
            ),
          ),
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

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.bgcolor,
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
                onTap: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.strokefill.withOpacity(.2),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SvgPicture.asset('assets/svgs/drawner.svg'),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),

              CircleAvatar(
                radius: 20,
                backgroundImage: const AssetImage('assets/images/Chisa.jpeg'),
              ),
            ],
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
        Image.asset('assets/images/banner/banner1.jpg', fit: BoxFit.cover),

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
          right: 16,
          child: SizedBox(
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/images/banner/changli.png'),
            ),
          ),
        ),

        Positioned(
          bottom: 16,
          left: 16,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Lihat Promo'),
          ),
        ),
      ],
    );
  }

  Widget bannerPageTwo() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/banner/banner2.jpg', fit: BoxFit.cover),

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

  Widget _trendChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget bannerPageThree() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/banner/banner3.jpg', fit: BoxFit.cover),

        Container(color: Colors.black.withOpacity(0.35)),

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
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Join Sekarang'),
          ),
        ),
      ],
    );
  }
}
