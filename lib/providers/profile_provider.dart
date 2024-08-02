import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/profile.dart';
import 'package:like_minds/models/dummy_data.dart';
import 'package:like_minds/models/interests.dart';

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
      : super(Profile(
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
            links: links));

  void changeFirstName(String firstName) {
    state = Profile(
        firstName: firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interests: state.interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeLastName(String lastName) {
    state = Profile(
        firstName: state.firstName,
        lastName: lastName,
        location: state.location,
        about: state.about,
        interests: state.interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeLocation(String location) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: location,
        about: state.about,
        interests: state.interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeAbout(String about) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: about,
        interests: state.interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeInterests(List<Interest> interests) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interests: interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeImageLink(String imageLink) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interests: state.interests,
        imageLink: imageLink,
        links: state.links);
  }

  void changeProfile(Profile profile) {
    state = profile;
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, Profile>((ref) {
  return ProfileNotifier();
});
