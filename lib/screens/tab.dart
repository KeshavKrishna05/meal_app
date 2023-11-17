import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:meal_app/provider/favourites_provider.dart';
import 'package:meal_app/provider/meals_provider.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

Map<Filter, bool> _kinitialfilter = {
  Filter.glutainfree: false,
  Filter.lactosefree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;
  //final List<Meal> favouritemeal = [];
  // void messenger(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // Map<Filter, bool> _selectedfilter = _kinitialfilter;

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => FiltersScreen(
              // currentfilter: _selectedfilter,
              )));
      // setState(() {
      //   _selectedfilter = result ?? _kinitialfilter;
      // });
    }
  }

  // void togglefavourite(Meal meal) {
  //   if (favouritemeal.contains(meal)) {
  //     setState(() {
  //       favouritemeal.remove(meal);
  //       messenger('Removed From Favourite');
  //     });
  //   } else {
  //     setState(() {
  //       favouritemeal.add(meal);
  //       messenger('Added To Favourite');
  //     });
  //   }
  // }

  void selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(context) {
    final meals = ref.watch(mealsprovider);
    final activefilter = ref.watch(filterprovider);
    final availablemeal = meals.where((meal) {
      if (activefilter[Filter.glutainfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[Filter.vegeterian]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = categories(
      availablemeal: availablemeal,
      // favourite: togglefavourite,
    );
    var activepagetitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favouritemeals = ref.watch(favouriteMealprovider);
      activepage = MealsScreen(
        meals: favouritemeals,
        // favourite: togglefavourite,
      );
      activepagetitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(onselect: setScreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourite'),
        ],
      ),
    );
  }
}
