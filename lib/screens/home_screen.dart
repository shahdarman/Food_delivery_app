import 'package:flutter/material.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/category_row.dart';
import '../widgets/restaurant_list.dart';
import '../widgets/points_badge.dart';
import '../widgets/app_bottom_navigation_bar.dart';
import '../core/constants/app_colors.dart';
import '../core/data/mock_data.dart';
import 'search_screen.dart';
//import 'orders_screen.dart';
//import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: AppColors.secondaryColor,
              elevation: 0,
              leadingWidth: 8,
              leading: const SizedBox(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivering to',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Almaadi',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: Colors.black,
                        weight: 500,
                      ),
                    ],
                  ),
                ],
              ),
              actions: const [
                PointsBadge(points: 7),
                SizedBox(width: 8),
              ],
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchBar(),
                  const SizedBox(height: 1.5),
                  CategoryRow(categories: firstRowCategories),
                  const SizedBox(height: 10),
                  CategoryRow(categories: secondRowCategories),
                  const SizedBox(height: 10),
                  const Text(
                    'Recommended for you',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 13),
                  RestaurantList(restaurants: restaurants),
                  const SizedBox(height: 10),
                  Container(
                    height: 210,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/banner.jfif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search Screen
          const SearchScreen(),

          // Orders Screen
          //const OrdersScreen(),

          // Account Screen
          //const AccountScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
