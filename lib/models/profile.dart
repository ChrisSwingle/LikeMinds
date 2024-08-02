import 'package:like_minds/models/interests.dart';

class Profile {
  Profile(
      {required this.firstName,
      required this.lastName,
      required this.location,
      required this.about,
      required this.interests,
      required this.imageLink,
      required this.links});

  final String firstName;
  final String lastName;
  final String location;
  final String about;
  final List<Interest> interests;
  final String imageLink;
  final List<Profile> links;
  // Images
}
