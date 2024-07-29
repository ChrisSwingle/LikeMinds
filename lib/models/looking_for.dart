import 'package:like_minds/models/profile.dart';

class LookingFor {
  LookingFor(
      {required this.profile,
      required this.title,
      required this.summary,
      required this.interest});

  final Profile profile;
  final String title;
  final String summary;
  final Interests interest;
}
