import 'package:meal_app/model/category.dart';
import 'package:flutter/material.dart';

class categoryGridItem extends StatelessWidget {
  categoryGridItem(
      {required this.categry, super.key, required this.onselectCategory});
  Category categry;
  void Function() onselectCategory;
  @override
  Widget build(context) {
    return InkWell(
      onTap: onselectCategory,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categry.color.withOpacity(0.55),
              categry.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categry.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
