import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class categories extends StatelessWidget {
  categories({
    super.key,
    // required this.favourite,
    required this.availablemeal,
  });
  // void Function(Meal meal) favourite;
  List<Meal> availablemeal;
  void selectCategory(BuildContext context, Category categry) {
    final filteredmeals = availablemeal
        .where((meal) => meal.categories.contains(categry.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: categry.title,
          meals: filteredmeals,
          // favourite: favourite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 1.5,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final categry in availableCategories)
          categoryGridItem(
            categry: categry,
            onselectCategory: () {
              selectCategory(context, categry);
            },
          ),
      ],
    );
  }
}
