import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/providers/profile_provider.dart';
import 'package:like_minds/screens/edit_filters_screen.dart';
import 'package:like_minds/screens/edit_profile_screen.dart';

import 'package:like_minds/screens/looking_for_screen.dart';
import 'package:like_minds/screens/post_looking_for_screen.dart';
import 'package:like_minds/screens/profile_screen.dart';

import '../models/profile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Profile profile;

  @override
  void initState() {
    profile = ref.read(profileProvider);
    super.initState();
  }

  void openEditProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const EditProfileScreen(),
      ),
    );
  }

  void openEditFilters() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const EditFiltersScreen(),
      ),
    );
  }

  int _selectedPageIndex = 0;
  var _activePageTitle = 'Looking for';

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    profile = ref.watch(profileProvider);

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
        profile: profile,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
        actions: _selectedPageIndex == 2 || _selectedPageIndex == 0
            ? [
                IconButton(
                  onPressed: _selectedPageIndex == 2
                      ? openEditProfile
                      : openEditFilters,
                  icon: const Icon(Icons.settings),
                ),
              ]
            : null,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), label: 'Looking for'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
