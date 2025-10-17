import 'dart:ui';
import 'package:flutter/material.dart';

class BrandsNearYou extends StatelessWidget {
  const BrandsNearYou({super.key});

  @override
  Widget build(BuildContext context) {
    final brandImages = [
      'assets/images/coffee_point.jfif',
      'assets/images/bremer.jfif',
      'assets/images/bremer.jfif',
      'assets/images/kingdom_pizza.jfif',
      'assets/images/kingdom_pizza.jfif',
      'assets/images/coffee_point.jfif',
      'assets/images/just_bakery.jfif',
      'assets/images/buffalo_burger.jfif',
      'assets/images/buffalo_burger.jfif',
      'assets/images/just_bakery.jfif',
    ];

    final statusMap = {
      'coffee_point.jfif': 'closed',
      'kingdom_pizza.jfif': 'busy',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Brands near you',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 9,
              runSpacing: 9,
              direction: Axis.vertical,
              children: brandImages.map((imagePath) {
                final fileName = imagePath.split('/').last;
                final status = statusMap[fileName];

                return Container(
                  height: 90,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: 85,
                          height: 90,
                        ),
                      ),
                      if (status == 'closed')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                            child: Container(
                              width: 85,
                              height: 90,
                              color: Color.fromRGBO(0, 0, 0, 0.74),
                              alignment: Alignment.center,
                              child: const Text(
                                'Closed',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (status == 'busy')
                        Container(
                          width: 85,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.74),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Busy',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
