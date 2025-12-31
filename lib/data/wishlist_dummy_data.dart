import 'package:hitam_market/model/wishlistModel.dart';

final List<WishListmodel> dummyLargeWishlist = List.generate(50, (index) {
  // Menggunakan 3 data template yang diulang
  final int dataIndex = index % 3;
  // Menggunakan gambar 1-4 secara bergantian
  final int imageIndex = (index % 5) + 1;

  String title;
  String description;
  int price;
  double rating;
  int totalReview;

  switch (dataIndex) {
    case 0:
      title = 'Women Printed Kurtav Fashion';
      description = 'Comfortable cotton kurta for daily wear baju baru bagus untuk lebaran';
      price = 1500;
      rating = 4.5;
      totalReview = 1212;
      break;
    case 1:
      title = 'Men foot page fashion shoes';
      description = 'Slim fit casual shoes with breathable material banyak pilihan warna baru';
      price = 1200;
      rating = 4.2;
      totalReview = 845;
      break;
    case 2:
    default:
      title = 'Leather Handbag Fashion Adidas new jersey amerika';
      description = 'Premium leather handbag with multiple compartments for various occasions';
      price = 3200;
      rating = 4.8;
      totalReview = 532;
      break;
  }

  return WishListmodel(
    image: 'assets/images/$imageIndex.jpg',
    title: title,
    description: description,
    price: price, // Pastikan tipe data sesuai dengan model (int/double/num)
    rating: rating,
    totalReview: totalReview,
  );
});