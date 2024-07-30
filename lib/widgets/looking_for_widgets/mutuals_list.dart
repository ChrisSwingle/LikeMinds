import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:like_minds/providers/profile_provider.dart';
import 'package:like_minds/models/profile.dart';
import 'package:like_minds/widgets/looking_for_widgets/profile_card.dart';

class MutualsList extends ConsumerStatefulWidget {
  const MutualsList({super.key});

  @override
  ConsumerState<MutualsList> createState() {
    return _MutualsListState();
  }
}

class _MutualsListState extends ConsumerState<MutualsList> {
  late final Profile profile;

  @override
  void didChangeDependencies() {
    profile = ref.watch(profileProvider);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (final profile in profile.links)
              ProfileCard(
                profile: profile,
              )
          ],
        ),
      ),
    );
  }
}
