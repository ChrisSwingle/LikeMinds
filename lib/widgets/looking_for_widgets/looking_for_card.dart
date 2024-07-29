import 'package:flutter/material.dart';

import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/screens/profile_screen.dart';
import 'package:like_minds/widgets/looking_for_widgets/looking_for_mutuals.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';

class LookingForCard extends StatelessWidget {
  const LookingForCard({super.key, required this.lookingFor});

  final LookingFor lookingFor;

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
                        profile: lookingFor.profile,
                      )),
                ),
              );
            },
          );
        },
      );
    }

    void openMutuals() {
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
                    child: LookingForMutuals(),
                  ),
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
                      lookingFor.profile.imageLink,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lookingFor.profile.firstName,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        lookingFor.profile.lastName,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InterestBubble(
                    title: lookingFor.interest.name.toString(),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  lookingFor.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              lookingFor.summary,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  lookingFor.profile.location,
                  style: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: openMutuals,
                  label: const Text('Matt'),
                  icon: const Icon(Icons.people),
                ),
                IconButton(
                  icon: const Icon(Icons.mail),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
