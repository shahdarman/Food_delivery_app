import '../models/food_category.dart';
import '../models/restaurant.dart';

/// Restaurant data
final restaurants = [
  const Restaurant(name: 'Buffalo Burger', imagePath: 'assets/images/buffalo_burger.jfif'),
  const Restaurant(name: 'Just Bakery', imagePath: 'assets/images/just_bakery.jfif'),
  const Restaurant(name: 'Bremer', imagePath: 'assets/images/bremer.jfif'),
  const Restaurant(name: 'Coffee Point', imagePath: 'assets/images/coffee_point.jfif'),
  const Restaurant(name: 'Kingdom Pizza', imagePath: 'assets/images/kingdom_pizza.jfif'),
];

/// Category data
final firstRowCategories = [
  const FoodCategory(imagePath: 'assets/images/food.png', title: 'Food'),
  const FoodCategory(
    imagePath: 'assets/images/shopping.png',
    title: 'fast    delivery',
    subtitle: '20 mins',
    isSpecial: true,
  ),
  const FoodCategory(imagePath: 'assets/images/super_markets.png', title: 'Super markets'),
  const FoodCategory(
    imagePath: 'assets/images/donates.png',
    title: 'Donate',
    subtitle: 'For Gaza',
    isSpecial: true,
  ),
];

final secondRowCategories = [
  const FoodCategory(imagePath: 'assets/images/pharmacy.png', title: 'Pharmacy'),
  const FoodCategory(
    imagePath: 'assets/images/pickup.png',
    title: 'Pickup',
    subtitle: '15% off',
    isSpecial: true,
  ),
  const FoodCategory(imagePath: 'assets/images/coffee.png', title: 'Coffee'),
  const FoodCategory(imagePath: 'assets/images/more_shopping.png', title: 'More shops'),
]; 

