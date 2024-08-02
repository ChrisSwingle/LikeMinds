import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/interests.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilitersNotifier extends StateNotifier<List<Interest>> {
  FilitersNotifier() : super([]);

  void setFilters(List<Interest> choosenFilters) {
    state = choosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FilitersNotifier, List<Interest>>(
    (ref) => FilitersNotifier());
