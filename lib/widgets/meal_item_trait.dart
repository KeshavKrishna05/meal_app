import 'package:flutter/material.dart';

class MealItemtrait extends StatelessWidget {
  MealItemtrait({super.key, required this.icon, required this.label});
  IconData icon;
  String label;
  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
