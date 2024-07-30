import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:like_minds/providers/filters_provider.dart';
import 'package:like_minds/providers/looking_for_provider.dart';
import 'package:like_minds/widgets/looking_for_widgets/looking_for_card.dart';

class LookingForScreen extends ConsumerWidget {
  const LookingForScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredLookingFor = ref.watch(lookingForProvider);
    final filters = ref.watch(filtersProvider);

    final filteredLookingForPosts = filters.isEmpty
        ? filteredLookingFor
        : filteredLookingFor.where((post) {
            if (filters.contains(post.interest)) {
              return true;
            } else {
              return false;
            }
          }).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (final post in filteredLookingForPosts)
              LookingForCard(lookingFor: post)
          ],
        ),
      ),
    );
  }
}
