import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/looking_for.dart';

class LookingForNotifier extends StateNotifier<List<LookingFor>> {
  LookingForNotifier() : super([]);

  void addLookingFor(LookingFor lookingFor) {
    state = [...state, lookingFor];
  }
}

final LookingForProvider =
    StateNotifierProvider<LookingForNotifier, List<LookingFor>>((ref) {
  return LookingForNotifier();
});
