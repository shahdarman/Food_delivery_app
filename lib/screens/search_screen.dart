import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/category_filters.dart';
import '../widgets/recent_searches.dart';
import '../widgets/brands_near_you.dart';
import '../widgets/popular_searches.dart';
import '../widgets/coffee_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(left: 0, right: 16),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 11),
              NotificationListener<CategoryChangedNotification>(
                onNotification: (notification) {
                  setState(() {
                    _currentCategoryIndex = notification.selectedIndex;
                  });
                  return true;
                },
                child: const CategoryFilters(),
              ),
              const SizedBox(height: 26),
              // Use IndexedStack to maintain both layouts
              IndexedStack(
                index: _currentCategoryIndex == 2 ? 0 : 1,
                children: [
                  // Coffee shops view (index 0)
                  const CoffeeShopsList(),
                  // Default view (index 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      RecentSearches(),
                      SizedBox(height: 30),
                      BrandsNearYou(),
                      SizedBox(height: 24),
                      PopularSearches(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}