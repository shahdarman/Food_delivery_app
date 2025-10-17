class MenuItem {
  final String name;
  final String description;
  final String price;
  final String image;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  static List<MenuItem> sampleItems = [
    MenuItem(
      name: 'Honey and Lemon Tea',
      description: 'Fresh lemon with honey and herbs',
      price: '90.00',
      image: 'images/Frame 68.png',
    ),
    MenuItem(
      name: 'English Tea',
      description: 'Special English tea',
      price: '40.00',
      image: 'images/Frame 73.png',
    ),
    MenuItem(
      name: 'Spanish Latte',
      description: 'Espresso with steamed milk and condensed milk',
      price: '120.00',
      image: 'images/Frame 72.png',
    ),
    MenuItem(
      name: 'Hazelnut Hot Chocolate',
      description: 'Hot chocolate with hazelnut essence',
      price: '80.75',
      image: 'images/Frame 69.png',
    ),
    MenuItem(
      name: 'Caramel Macchiato',
      description: 'Blend of espresso, milk...',
      price: '110.50',
      image: 'images/Frame 73.png',
    ),
  ];
}