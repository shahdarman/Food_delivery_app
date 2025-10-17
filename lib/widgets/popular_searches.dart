import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';

class PopularSearches extends StatelessWidget {
  const PopularSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final searches = ['sale sucre', 'coffee point', 'stereo', 'labour', 'chicken kickers', 'granita', 'coffee wizard', 'healthy diet'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular searches', 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 19,
            color: Colors.black, 
          ),
        ),
        const SizedBox(height: 9),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: searches.map((item) => Chip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.trending_up, 
                  size: 18,
                  color: const Color.fromRGBO(84, 84, 84, 1),
                ),
                const SizedBox(width: 6),
                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16, 
                    color: Color.fromRGBO(84, 84, 84, 1), 
                    fontWeight: FontWeight.w400, 
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.secondaryColor, 
            side: BorderSide(
              color: AppColors.primaryColor, 
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 1,
            ),
          )).toList(),
        ),
      ],
    );
  }
}