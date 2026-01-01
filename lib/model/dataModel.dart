// ignore_for_file: file_names

class Datamodel {
  final String image;
  final String title;
  final String description;
  final int price;
  final int originalPrice;
  final int discount;
  final double rating;
  final int totalReview;

  Datamodel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.totalReview,
  });

  static final List<Datamodel> dummyDataModel = [
    Datamodel(
      image: 'assets/images/1.jpg',
      title: 'Women Printed Kurtav afafasfasfsafas',
      description: 'Comfortable cotton kurta for daily wear safsaassaasasfa',
      price: 1500,
      originalPrice: 2500,
      discount: 40,
      rating: 4.5,
      totalReview: 1212,
    ),
    Datamodel(
      image: 'assets/images/2.jpg',
      title: 'Men Casual Shirt asfasfafasfafafafasfasfa',
      description: 'Slim fit casual shirtcasccascsacascascasacaaca',
      price: 1200,
      originalPrice: 2000,
      discount: 35,
      rating: 4.2,
      totalReview: 845,
    ),
    Datamodel(
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
}
