import 'package:flutter/material.dart';
import 'package:like_minds/screens/edit_filters_screen.dart';
import 'package:like_minds/screens/edit_profile_screen.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Background color
            side: const BorderSide(
                color: Colors.white, width: 2), // Border color and width
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12), // Padding
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          onPressed: openEditProfile,
          child: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Background color
            side: const BorderSide(
                color: Colors.white, width: 2), // Border color and width
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12), // Padding
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          onPressed: openEditFilters,
          child: const Text(
            "Edit Looking for feed filters",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
