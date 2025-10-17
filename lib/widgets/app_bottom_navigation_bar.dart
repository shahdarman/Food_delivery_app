import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: const Color.fromRGBO(84, 84, 84, 1),
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      onTap: onTap, 
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 32),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 32),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined, size: 32),
          activeIcon: Icon(Icons.receipt_long, size: 32),
          label: 'Orders', 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined, size: 32),
          activeIcon: Icon(Icons.person_2, size: 32),
          label: 'Account',
        ),
      ],
    );
  }
}