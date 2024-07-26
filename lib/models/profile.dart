enum Interests {
  sports,
  art,
  music,
  theatre,
  movies,
  food,
  travel,
  coding,
  photography,
  basketball,
  baseball,
  soccer,
  golf,
  spikeball,
  pickleball,
}

class Profile {
  Profile(
      {required this.firstName,
      required this.lastName,
      required this.location,
      required this.about,
      required this.interest});

  final String firstName;
  final String lastName;
  final String location;
  final String about;
  final List<Interests> interest;
  // Images
}
