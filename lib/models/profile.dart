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
  anime,
}

class Profile {
  Profile(
      {required this.firstName,
      required this.lastName,
      required this.location,
      required this.about,
      required this.interest,
      required this.imageLink});

  final String firstName;
  final String lastName;
  final String location;
  final String about;
  final List<Interests> interest;
  final String imageLink;
  // Images
}
