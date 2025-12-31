// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hitam_market/model/bottomNavbar.dart';
import 'package:hitam_market/page/content/home_page.dart';
import 'package:hitam_market/page/content/shop_page.dart';
import 'package:hitam_market/page/content/wishlist_page.dart';
import 'package:hitam_market/provider/template_provider.dart';
import 'package:hitam_market/theme/app_colors.dart';
import 'package:provider/provider.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  static const int noActiveIndex = 99;

  @override
  Widget build(BuildContext context) {
    final navProv = context.watch<TemplateProvider>();

    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: (navProv.centerFloatingButton) ? _appBarShop(context) : _appBar(),
      body: _buildBody(context, navProv.currentIndex),

      /// FLOATING BUTTON TENGAH
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 42),
        // onTap: () {
        //   context.read<TemplateProvider>().setCenterFloatingButton(
        //     true,
        //   );
        // },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (navProv.centerFloatingButton)
                ? AppColors.primaryDark
                : AppColors.bgcolor,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/svgs/shopping.svg',
                color: (navProv.centerFloatingButton)
                    ? AppColors.bgcolor
                    : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Bottomnavbar(
        currentIndex: navProv.centerFloatingButton
            ? noActiveIndex
            : navProv.currentIndex,
        onTap: (index) {
          final prov = context.read<TemplateProvider>();

          if (prov.centerFloatingButton) {
            // keluar dari mode center FAB
            prov.setCenterFloatingButton(false);
          }

          prov.setCurrentIndex(index);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    final prov = context.watch<TemplateProvider>();

    // MODE SHOP
    if (prov.centerFloatingButton) {
      return const ShopPage();
    }

    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const WishlistPage();
      case 2:
        return const WishlistPage();
      case 3:
        return const HomePage();
      default:
        return const HomePage();
    }
  }

  AppBar _appBar() {
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

  AppBar _appBarShop(BuildContext context) {
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
                  context.read<TemplateProvider>().closeShop();
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
                      width: 20,
                      height: 20,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SvgPicture.asset(
                          'assets/svgs/cart.svg',
                          color: AppColors.textPrimary,
                        ),
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
