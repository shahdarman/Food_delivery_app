import 'package:flutter/material.dart';

class CoffeePointMenuScreen extends StatefulWidget {
  const CoffeePointMenuScreen({super.key});

  @override
  State<CoffeePointMenuScreen> createState() => _CoffeePointMenuScreenState();
}

class _CoffeePointMenuScreenState extends State<CoffeePointMenuScreen> {
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

      backgroundColor: const Color(0xfff5DECB),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
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
                  'images/coffe_point.png', //
                  height: 30,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 60.0), //
                child: Center(
                  child: Image.asset(
                    'images/select/point.png',
                    height: 84,
                  ),
                ),
              ),
            ),
            actions: [

              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  // Handle search
                },
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_outlined, color: Colors.grey),
                onPressed: () {
                  // Handle more options
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildCategoryTabs(),
              const SizedBox(height: 16),
              _buildMenuItemList(),
              const SizedBox(height: 80),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: _buildCheckoutBar(context),

    );
  }

  // --- Category Tabs ---
  Widget _buildCategoryTabs() {
    const categories = [
      'All',
      'Hot drinks',
      'Cold drinks',
      'Croissant',
      'Sandwiches',
      // Add more categories
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) => Padding(
            padding: const EdgeInsets.only(right: 12 ),
            child: _buildCategoryTabItem(category: category, isSelected: category == 'Hot drinks'),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryTabItem({required String category, bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff5DECB): Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? const Color(0xFF4B1515) : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- Menu Item List ---
  Widget _buildMenuItemList() {
    // Replace with your actual menu item data
    final menuItems = [
      {'name': 'Honey and Lemon Tea', 'description': 'Fresh lemon with honey and herbs', 'price': '90.00', 'image': 'images/Frame 68.png'},
      {'name': 'English Tea', 'description': 'Special english tea', 'price': '40.00', 'image': 'images/Frame 73.png'},
      {'name': 'Spanish Latte', 'description': 'Espresso with steamed milk and condensed milk', 'price': '120.00', 'image': 'images/Frame 72.png'},
      {'name': 'Hazelnut Hot Chocolate', 'description': 'Hot chocolate with hazelnut essence', 'price': '80.75', 'image': 'images/Frame 69.png'},
      {'name': 'Caramel Macchiato', 'description': 'Blend of espresso, milk...', 'price': '110.50', 'image': 'images/Frame 73.png'},
      // Add more menu items
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // To disable ListView's scrolling
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16 ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _buildMenuItemCard(item: item);
        },
      ),
    );
  }

  Widget _buildMenuItemCard({required Map<String, String> item}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12) ),color: Color(0xfff5DECB),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item['image']!,
                  fit: BoxFit.cover,
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
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['description']!,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF4B1515)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'EGP ${item['price']!}',
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF4B1515)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildQuantityControl(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _buildQuantityButton(icon: Icons.remove, onPressed: () {
          Navigator.pop(context);

        }),
        const SizedBox(width: 6),
        const Text('0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(width: 6),
        _buildQuantityButton(icon: Icons.add, onPressed: () {
          Navigator.pop(context);
          } ,  ),
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
          border: Border.all(color: const Color(0xff4B1515)),
        ),
        child: Icon(icon, size: 10, color: Color(0xff4B1515)),

      ),
    );
  }

  // --- Checkout Bar ---

  Widget _buildCheckoutBar(BuildContext context)
  {


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
                  borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF4B1515), width: 1)
                ),
                child: const Text(
                  '3',
                  style: TextStyle(color: Color(0xff4B1515), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width:12 ),
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