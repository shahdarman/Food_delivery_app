import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CategoryChangedNotification extends Notification {
  final int selectedIndex;
  CategoryChangedNotification(this.selectedIndex);
}

class CategoryFilters extends StatefulWidget {
  const CategoryFilters({super.key});

  @override
  State<CategoryFilters> createState() => _CategoryFiltersState();
}

class _CategoryFiltersState extends State<CategoryFilters> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Food',
      'Coffee',
      'Groceries',
      'More'
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              
              CategoryChangedNotification(index).dispatch(context);
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.primaryColor 
                    : const Color.fromRGBO(240, 240, 240, 1), 
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: isSelected
                      ? const Color.fromRGBO(240, 240, 240, 1)
                      : const Color.fromRGBO(84, 84, 84, 1), 
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}