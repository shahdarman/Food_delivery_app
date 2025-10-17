import 'package:flutter/material.dart';
import '../core/models/restaurant.dart';
import '../core/constants/app_colors.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantList({
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  height: 125,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: restaurants.length,
    padding: EdgeInsets.only(left: 3),
    physics: const ClampingScrollPhysics(), 
    itemExtent: 94, 
    itemBuilder: (context, index) {
      final restaurant = restaurants[index];
      return Container(
        margin: EdgeInsets.only(right: index == restaurants.length - 1 ? 0 : 2),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                restaurant.imagePath,
                height: 90,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6), 
            Padding(
              padding: const EdgeInsets.all(2.5), 
              child: Text(
                restaurant.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      );
    },
  ),
);
  }
}