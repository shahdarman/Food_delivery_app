class FoodCategory {
  final String imagePath;
  final String title;
  final String? subtitle;
  final bool isSpecial;

  const FoodCategory({
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.isSpecial = false,
  });
} 