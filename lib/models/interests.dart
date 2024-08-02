enum Interest {
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

enum Category {
  sport,
  art,
  outside,
  inside,
  exercise,
  tv,
  music,
  movie,
  creative,
  other,
  computer,
}

class InterestsModel {
  InterestsModel({required this.interest, required this.categories});

  final Interest interest;
  final List<Category> categories;
}

List<InterestsModel> availableInterestsModel = [
  InterestsModel(
      interest: Interest.sports,
      categories: [Category.sport, Category.exercise]),
  InterestsModel(
      interest: Interest.art, categories: [Category.art, Category.creative]),
  InterestsModel(interest: Interest.music, categories: [Category.music]),
  InterestsModel(interest: Interest.theatre, categories: [Category.art]),
  InterestsModel(
      interest: Interest.movies, categories: [Category.movie, Category.inside]),
  InterestsModel(
      interest: Interest.food, categories: [Category.other, Category.inside]),
  InterestsModel(
      interest: Interest.travel,
      categories: [Category.outside, Category.other]),
  InterestsModel(
      interest: Interest.coding,
      categories: [Category.computer, Category.inside]),
  InterestsModel(
      interest: Interest.photography,
      categories: [Category.art, Category.creative]),
  InterestsModel(interest: Interest.baseball, categories: [Category.sport]),
  InterestsModel(
      interest: Interest.baseball,
      categories: [Category.sport, Category.outside]),
  InterestsModel(
      interest: Interest.soccer,
      categories: [Category.sport, Category.outside]),
  InterestsModel(
      interest: Interest.golf, categories: [Category.sport, Category.outside]),
  InterestsModel(
      interest: Interest.spikeball,
      categories: [Category.sport, Category.outside]),
  InterestsModel(
      interest: Interest.pickleball,
      categories: [Category.sport, Category.outside]),
  InterestsModel(
      interest: Interest.anime, categories: [Category.movie, Category.tv]),
];
