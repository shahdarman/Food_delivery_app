import 'package:flutter/material.dart';
import '../core/models/food_category.dart';
import '../core/constants/app_colors.dart';

class CategoryRow extends StatelessWidget {
  final List<FoodCategory> categories;

  const CategoryRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0.005, vertical: 3),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return SizedBox(
            width: 108,
            child: Stack( 
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(60),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          category.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (category.isSpecial && category.subtitle != null)
                Positioned(
                  bottom: 42, 
                  left: 22,   
                  child: Container(
                  width: 61, 
                  height: 19, 
                  decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(13),
                  ),
                child: Center( 
                child: Text(
                category.subtitle!,
                style: const TextStyle(
                color: Color.fromRGBO(236, 236, 236, 1), 
                fontSize: 12, 
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                ),
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
