import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/models/profile.dart';

final Profile tempProfile = Profile(
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
    links: links);

final List<LookingFor> _tempLookingFor = [
  LookingFor(
      profile: tempProfile,
      title: 'Tring to play pickle ball',
      summary:
          'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
      interest: Interests.pickleball),
  LookingFor(
      profile: tempProfile,
      title: 'Tring to play soccer',
      summary:
          'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
      interest: Interests.soccer),
  LookingFor(
      profile: tempProfile,
      title: 'Tring to make an app',
      summary:
          'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
      interest: Interests.coding),
  LookingFor(
      profile: tempProfile,
      title: 'Tring to take pictures',
      summary:
          'I am trying to play some pickle ball at some courts in westfield. I am pretty decent at the game and I am easy to play with. Competive enough but I wont argue too much on outs.',
      interest: Interests.photography)
];
final links = [
  Profile(
      firstName: 'John',
      lastName: 'Doe',
      location: 'NY, NY',
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
      links: []),
  Profile(
      firstName: 'Jane',
      lastName: 'Doe',
      location: 'NY, NY',
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
      links: [])
];
