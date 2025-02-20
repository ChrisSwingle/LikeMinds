import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/models/profile.dart';
import 'package:like_minds/models/interests.dart';

final Profile _tempProfile = Profile(
    firstName: 'Chris',
    lastName: 'Swingle',
    location: 'Westfield NJ',
    about:
        'Musician and coder who also enjoys coooking and clothes all typpes of cooll stuff like making sutff',
    interests: [
      Interest.art,
      Interest.coding,
      Interest.photography,
      Interest.music,
      Interest.pickleball,
      Interest.movies
    ],
    imageLink: 'lib/images/me.jpg',
    links: [
      Profile(
          firstName: 'John',
          lastName: 'Doe',
          location: 'NY, NY',
          about:
              'Musician and coder who also enjoys coooking and clothes all typpes of cooll stuff like making sutff',
          interests: [
            Interest.art,
            Interest.coding,
            Interest.photography,
            Interest.music,
            Interest.pickleball,
            Interest.movies
          ],
          imageLink: 'lib/images/me.jpg',
          links: []),
      Profile(
        firstName: 'Jane',
        lastName: 'Doe',
        location: 'NY, NY',
        about:
            'Musician and coder who also enjoys coooking and clothes all typpes of cooll stuff like making sutff',
        interests: [
          Interest.art,
          Interest.coding,
          Interest.photography,
          Interest.music,
          Interest.pickleball,
          Interest.movies
        ],
        imageLink: 'lib/images/me.jpg',
        links: [],
      )
    ]);

class LookingForNotifier extends StateNotifier<List<LookingFor>> {
  LookingForNotifier()
      : super(
          [
            LookingFor(
                profile: _tempProfile,
                title: 'Tring to play pickle ball',
                summary:
                    'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
                interest: Interest.pickleball),
            LookingFor(
                profile: _tempProfile,
                title: 'Tring to play soccer',
                summary:
                    'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
                interest: Interest.soccer),
            LookingFor(
                profile: _tempProfile,
                title: 'Tring to make an app',
                summary:
                    'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
                interest: Interest.coding),
            LookingFor(
                profile: _tempProfile,
                title: 'Tring to take pictures',
                summary:
                    'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
                interest: Interest.photography)
          ],
        );

  void addLookingFor(LookingFor lookingFor) {
    state = [...state, lookingFor];
  }
}

final lookingForProvider =
    StateNotifierProvider<LookingForNotifier, List<LookingFor>>((ref) {
  return LookingForNotifier();
});
