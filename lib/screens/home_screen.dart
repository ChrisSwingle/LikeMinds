import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/providers/profile_provider.dart';

import 'package:like_minds/screens/looking_for_screen.dart';
import 'package:like_minds/screens/post_looking_for_screen.dart';
import 'package:like_minds/screens/profile_screen.dart';
import 'package:like_minds/widgets/profile_widgets/profile_settings.dart';

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

  void openProfileSetting() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow the modal to take more space
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.3,
          child: DraggableScrollableSheet(
            initialChildSize:
                1.0, // Initial size of the sheet as a fraction of the screen height
            minChildSize:
                1.0, // Prevents the sheet from being dragged down beyond this point
            maxChildSize:
                1.0, // Prevents the sheet from being dragged up beyond this point
            expand: false, // Keeps the sheet at the initial size
            builder: (BuildContext context, ScrollController scrollController) {
              return LayoutBuilder(builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth, // Full width of the screen
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: const ProfileSettings(),
                  ),
                );
              });
            },
          ),
        );
      },
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
        actions: _selectedPageIndex == 2
            ? [
                IconButton(
                  onPressed: openProfileSetting,
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
