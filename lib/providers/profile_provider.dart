import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/profile.dart';
import 'package:like_minds/models/dummy_data.dart';

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
      : super(Profile(
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
            imageLink: 'lib/images/me.jpg',
            links: links));

  void changeFirstName(String firstName) {
    state = Profile(
        firstName: firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interest: state.interest,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeLastName(String lastName) {
    state = Profile(
        firstName: state.firstName,
        lastName: lastName,
        location: state.location,
        about: state.about,
        interest: state.interest,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeLocation(String location) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: location,
        about: state.about,
        interest: state.interest,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeAbout(String about) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: about,
        interest: state.interest,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeInterests(List<Interests> interests) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interest: interests,
        imageLink: state.imageLink,
        links: state.links);
  }

  void changeImageLink(String imageLink) {
    state = Profile(
        firstName: state.firstName,
        lastName: state.lastName,
        location: state.location,
        about: state.about,
        interest: state.interest,
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
