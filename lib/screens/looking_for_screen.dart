import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/models/profile.dart';
import 'package:like_minds/providers/looking_for_provider.dart';
import 'package:like_minds/widgets/looking_for_widgets/looking_for_card.dart';

class LookingForScreen extends ConsumerWidget {
  const LookingForScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _lookingFor = ref.watch(LookingForProvider);
    final Profile _tempProfile = Profile(
        firstName: 'Chris',
        lastName: 'Swingle',
        location: 'Westfield NJ',
        about:
            'Musician and coder who also enjoys coooking and clothes all typpes of cooll stuff like making sutff',
        interest: [
          Interests.art,
          Interests.coding,
          Interests.photography,
          Interests.music,
          Interests.pickleball,
          Interests.movies
        ],
        imageLink: 'lib/images/me.jpg');

    final List<LookingFor> _tempLookingFor = [
      LookingFor(
          profile: _tempProfile,
          title: 'Tring to play pickle ball',
          summary:
              'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
          interest: Interests.pickleball),
      LookingFor(
          profile: _tempProfile,
          title: 'Tring to play soccer',
          summary:
              'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
          interest: Interests.soccer),
      LookingFor(
          profile: _tempProfile,
          title: 'Tring to make an app',
          summary:
              'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
          interest: Interests.coding),
      LookingFor(
          profile: _tempProfile,
          title: 'Tring to take pictures',
          summary:
              'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
          interest: Interests.photography)
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (final post in _lookingFor) LookingForCard(lookingFor: post)
          ],
        ),
      ),
    );
  }
}
