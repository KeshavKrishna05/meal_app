import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);
  bool favouritetoggle(Meal meal) {
    final iscontained = state.contains(meal);
    if (iscontained) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealprovider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>(
  (ref) => FavouriteMealNotifier(),
);
