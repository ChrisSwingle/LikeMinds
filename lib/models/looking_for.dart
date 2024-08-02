import 'package:like_minds/models/profile.dart';
import 'package:like_minds/models/interests.dart';

class LookingFor {
  LookingFor(
      {required this.profile,
      required this.title,
      required this.summary,
      required this.interest});

  final Profile profile;
  final String title;
  final String summary;
  final Interest interest;
}
