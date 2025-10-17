import 'package:flutter/material.dart';
import '../core/models/coffee_shop.dart';
import '../screens/coffee_shop.dart';

class CoffeeShopsList extends StatelessWidget {
  const CoffeeShopsList({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeShops = CoffeeShop.sampleShops;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: coffeeShops.length,
          separatorBuilder: (context, index) => const SizedBox(height: 22),
          itemBuilder: (context, index) {
            final shop = coffeeShops[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeeShopScreen(shop: shop),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
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
                          shop.imagePath, 
                          width: 135,
                          height: 85,
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
                            shop.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            shop.tags,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(53,53,53,1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.timer_outlined, color: Color.fromRGBO(53,53,53,1), size: 16),
                              const SizedBox(width: 4),
                              Text(
                                shop.deliveryTime,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(53,53,53,1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                shop.rating.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(53,53,53,1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}