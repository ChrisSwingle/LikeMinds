import 'package:flutter/material.dart';
import 'package:like_minds/screens/looking_for_screen.dart';
import 'package:like_minds/screens/post_looking_for_screen.dart';
import 'package:like_minds/screens/profile_screen.dart';

import '../models/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  var _activePageTitle = 'Looking for';

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final Profile _tempProfile = Profile(
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
      ]);

  @override
  Widget build(BuildContext context) {
    Widget activePage = const LookingForScreen();

    if (_selectedPageIndex == 0) {
      _activePageTitle = 'Looking for';
      activePage = const LookingForScreen();
    }

    if (_selectedPageIndex == 1) {
      _activePageTitle = 'Post to looking for';
      activePage = const PostLookingForScreen();
    }

    if (_selectedPageIndex == 2) {
      _activePageTitle = 'Profile';
      activePage = ProfileScreen(
        profile: _tempProfile,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(_activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), label: 'Looking for'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
