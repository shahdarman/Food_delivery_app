class CoffeeShop {
  final String name;
  final String tags;
  final String deliveryTime;
  final double rating;
  final String imagePath;
  final String location;

  CoffeeShop({
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.rating,
    required this.imagePath,
    required this.location,
  });

  // Sample data
  static List<CoffeeShop> get sampleShops => [
    CoffeeShop(
      name: 'Coffee Point',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 7.5,
      imagePath: 'assets/images/coffee_point.jfif',
      location: '123 Main St, Anytown, USA',
    ),
    CoffeeShop(
      name: 'Rivo',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 4.5,
      imagePath: 'assets/images/coffee_shops/rivo.jpg',
      location: '123 Main St, Anytown, USA',
    ),
    CoffeeShop(
      name: 'Espresso Lab',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 8.5,
      imagePath: 'assets/images/coffee_shops/espresso_lab.jpg',
      location: '123 Main St, Anytown, USA',
    ),
    CoffeeShop(
      name: 'Koffieart',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 8.5,
      imagePath: 'assets/images/coffee_shops/koffieart.jpg',
      location: '123 Main St, Anytown, USA',
    ),
    CoffeeShop(
      name: 'Coffee wizard',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 2.5,
      imagePath: 'assets/images/coffee_shops/coffee_wizard.jpg',
      location: '123 Main St, Anytown, USA',
    ),
    CoffeeShop(
      name: 'Deepoint',
      tags: 'coffee, desserts, breakfast',
      deliveryTime: '35 mins',
      rating: 3.5,
      imagePath: 'assets/images/coffee_shops/deepoint.jpg',
      location: '123 Main St, Anytown, USA',
    ),
  ];
}