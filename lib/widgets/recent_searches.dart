import 'package:flutter/material.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final searches = ['sale sucre', 'coffee point', 'stereo', 'labour', 'chicken kickers'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
        const SizedBox(height: 13.5),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: searches.map((item) => Container(
          decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.history, 
              size: 16,
              color: Color.fromRGBO(84, 84, 84, 1),
              ),
            const SizedBox(width: 6),
            Text(
              item,
              style: const TextStyle(
              color: Color.fromRGBO(84, 84, 84, 1),
              fontSize: 14,
              ),
            ),  
          ],
        ),
      )).toList(),
     )
    ],
    );
  }
}
