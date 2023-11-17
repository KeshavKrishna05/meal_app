import 'package:flutter/material.dart';
// import 'package:meal_app/screens/tab.dart';
// import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen({
    super.key,
    // required this.currentfilter,
  });
  // Map<Filter, bool> currentfilter;
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

// enum Filter { glutainfree, lactosefree, vegeterian, vegan }

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _gluteenfreefiltercheck = false;
  var _lactosefreefiltercheck = false;
  var _vegeterianfiltercheck = false;
  var _veganfiltercheck = false;

  @override
  void initState() {
    super.initState();
    final activefilter = ref.read(filterprovider);
    _gluteenfreefiltercheck = activefilter[Filter.glutainfree]!;
    _lactosefreefiltercheck = activefilter[Filter.lactosefree]!;
    _vegeterianfiltercheck = activefilter[Filter.vegeterian]!;
    _veganfiltercheck = activefilter[Filter.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onselect: (identifier) {
      //   Navigator.pop(context);
      //   if (identifier == 'meals') {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => TabScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        //Why is this being used here
        onWillPop: () async {
          ref.read(filterprovider.notifier).setfilters({
            Filter.glutainfree: _gluteenfreefiltercheck,
            Filter.lactosefree: _lactosefreefiltercheck,
            Filter.vegeterian: _vegeterianfiltercheck,
            Filter.vegan: _veganfiltercheck,
          });
          // Navigator.of(context).pop();
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluteenfreefiltercheck,
              onChanged: (oncheck) {
                setState(() {
                  _gluteenfreefiltercheck = oncheck;
                });
              },
              title: Text(
                'Gluteen Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only glutten free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _lactosefreefiltercheck,
              onChanged: (oncheck) {
                setState(() {
                  _lactosefreefiltercheck = oncheck;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only lactose free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _vegeterianfiltercheck,
              onChanged: (oncheck) {
                setState(() {
                  _vegeterianfiltercheck = oncheck;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only Vegeterian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _veganfiltercheck,
              onChanged: (oncheck) {
                setState(() {
                  _veganfiltercheck = oncheck;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only Veganmeals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
