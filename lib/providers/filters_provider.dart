import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/profile.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilitersNotifier extends StateNotifier<List<Interests>> {
  FilitersNotifier() : super([]);

  void setFilters(List<Interests> choosenFilters) {
    state = choosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FilitersNotifier, List<Interests>>(
        (ref) => FilitersNotifier());
