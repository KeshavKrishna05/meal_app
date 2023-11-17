import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutainfree, lactosefree, vegeterian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutainfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
        });
  void setfilters(Map<Filter, bool> choosenfilters) {
    state = choosenfilters;
  }

  void setfilter(Filter filter, bool isactive) {
    state = {
      ...state,
      filter: isactive,
    };
  }
}

final filterprovider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());
