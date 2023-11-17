import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';

import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({super.key, required this.meal, required this.onselectmeal});
  Meal meal;
  final void Function(BuildContext context, Meal meal) onselectmeal;
  String complexity() {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String affordability() {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(context) {
    return Card(
      child: InkWell(
          onTap: () {
            onselectmeal(context, meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(
                    kTransparentImage), //  Ask what exactly happining
                image: NetworkImage(meal.imageUrl),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 40,
                    ),
                    child: Column(children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemtrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 20,
                          ),
                          MealItemtrait(
                            icon: Icons.work,
                            label: complexity(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MealItemtrait(
                            icon: Icons.money,
                            label: affordability(),
                          ),
                        ],
                      )
                    ]),
                  )),
            ],
          )),
    );
  }
}
