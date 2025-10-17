import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Widget that displays user points with a gift icon
class PointsBadge extends StatelessWidget {
  final double points;

  const PointsBadge({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.card_giftcard,
            color: AppColors.pointsColor,
            size: 23,
          ),
          const SizedBox(width: 2),
          Text(
            points.toStringAsFixed(3),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.pointsColor,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'points',
            style: TextStyle(
              fontSize: 14, 
              color: AppColors.pointsColor,
            ),
          ),
        ],
      ),
    );
  }
} 