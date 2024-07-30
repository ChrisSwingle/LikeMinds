import 'package:flutter/material.dart';

import 'package:like_minds/models/profile.dart';
import 'package:like_minds/screens/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    void openProfile() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allow the modal to take more space
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            initialChildSize:
                0.9, // Initial size of the sheet as a fraction of the screen height
            minChildSize:
                0.9, // Prevents the sheet from being dragged down beyond this point
            maxChildSize:
                0.9, // Prevents the sheet from being dragged up beyond this point
            expand: false, // Keeps the sheet at the initial size
            builder: (BuildContext context, ScrollController scrollController) {
              return SafeArea(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: ProfileScreen(
                        profile: profile,
                      )),
                ),
              );
            },
          );
        },
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: openProfile,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      profile.imageLink,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    profile.firstName,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    profile.lastName,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
