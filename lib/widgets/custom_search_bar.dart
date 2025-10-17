import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 413,
        height: 90,
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black.withAlpha(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 4,
                offset: const Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextField(
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Search food, groceries & more',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.searchBar,
            ),
          ),
        ),
      ),
    );
  }
} 