// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [Text('Wishlist Page')]),
      ),
    );
  }  
}
