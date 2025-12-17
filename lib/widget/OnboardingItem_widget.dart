// ignore_for_file: file_names

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingItem> onboardingData = [
  OnboardingItem(
    image: 'assets/images/fashion_shop_rafiki.png',
    title: 'Choose Products',
    description:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
  ),
  OnboardingItem(
    image: 'assets/images/Sales_consulting_pana.png',
    title: 'Make Payment',
    description:
        'Velit officia consequat duis enim velit mollit exercitation.',
  ),
  OnboardingItem(
    image: 'assets/images/Shopping_bag_rafiki.png',
    title: 'Fast Delivery',
    description:
        'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
  ),
];
