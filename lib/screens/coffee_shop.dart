import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import '../core/models/coffee_shop.dart';

class CoffeeShopScreen extends StatefulWidget {
  final CoffeeShop shop;

  const CoffeeShopScreen({super.key, required this.shop});

  @override
  State<CoffeeShopScreen> createState() => _CoffeeShopScreenState();
}

class _CoffeeShopScreenState extends State<CoffeeShopScreen> {
  final ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenToScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenToScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _listenToScroll() {
    if (_scrollController.offset > 100) {
      setState(() {
        _appBarOpacity = 1.0;
      });
    } else {
      setState(() {
        _appBarOpacity = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined, color: Colors.grey),
            ),
            title: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _appBarOpacity,
                child: Image.asset(
                  widget.shop.imagePath,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Hero(
                    tag: 'coffee-image-${widget.shop.name}',
                    child: Image.asset(
                      widget.shop.imagePath,
                      height: 550,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_outlined, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 16),
              _buildCategoryTabs(),
              const SizedBox(height: 0),
              _buildMenuItemList(),
              const SizedBox(height: 0),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: _buildCheckoutBar(context),
    );
  }

  Widget _buildCategoryTabs() {
    const categories = [
      'All',
      'Hot drinks',
      'Cold drinks',
      'Pastries',
      'Sandwiches',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 1),
              child: _buildCategoryTabItem(category: category, isSelected: category == 'Hot drinks'),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryTabItem({required String category, bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: isSelected ? AppColors.primaryColor : Color.fromRGBO(91, 91, 91, 1), width: 3.2),
        ),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 18,
          color: isSelected ? AppColors.primaryColor : Color.fromRGBO(98, 98, 98, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMenuItemList() {
    final menuItems = [
      {'name': 'Honey and Lemon Tea', 'description': 'Fresh lemon with honey and herbs', 'price': '90.00', 'image': 'assets/images/coffee_point/lemon_tea.png'},
      {'name': 'English Tea', 'description': 'Special english tea', 'price': '40.00', 'image': 'assets/images/coffee_point/english_tea.png'},
      {'name': 'Spanish Latte', 'description': 'Espresso with steamed milk and condensed milk', 'price': '120.00', 'image': 'assets/images/coffee_point/spanish_latte.png'},
      {'name': 'Hazelnut Hot Chocolate', 'description': 'Hot chocolate with hazelnut essence', 'price': '80.75', 'image': 'assets/images/coffee_point/hazelnut_hot_chocolate.png'},
      {'name': 'Caramel Macchiato', 'description': 'Blend of espresso, milk...', 'price': '110.50', 'image': 'assets/images/coffee_point/caramel_macchiato.png'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _buildMenuItemCard(item: item);
        },
      ),
    );
  }

  Widget _buildMenuItemCard({required Map<String, String> item}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),  
                border: Border.all(
                  color: Color.fromRGBO(106, 106, 106, 1),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), 
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item['description']!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(53, 53, 53, 1),
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'EGP ${item['price']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.5,
                      color: Color.fromRGBO(53, 53, 53, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildQuantityControl(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _buildQuantityButton(icon: Icons.remove, onPressed: () {}),
        const SizedBox(width: 6),
        const Text('0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(width: 6),
        _buildQuantityButton(icon: Icons.add, onPressed: () {}),
      ],
    );
  }

  Widget _buildQuantityButton({required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Icon(icon, size: 10, color: AppColors.primaryColor),
      ),
    );
  }

  // --- Checkout Bar ---
  Widget _buildCheckoutBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xffFCFCFC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5DECB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF4B1515), width: 1),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(color: Color(0xff4B1515), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Proceed to checkout',
                style: TextStyle(color: Color(0xFF4B1515), fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                '320.75 EGP',
                style: TextStyle(color: Color(0xFF4B1515), fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Icon(Icons.arrow_forward_ios, color: Color(0xFF4B1515), size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
