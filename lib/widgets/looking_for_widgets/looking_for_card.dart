import 'package:flutter/material.dart';
import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';

class LookingForCard extends StatelessWidget {
  const LookingForCard({super.key, required this.lookingFor});

  final LookingFor lookingFor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                InterestBubble(
                  title: lookingFor.interest.name.toString(),
                ),
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
                  width: 5,
                ),
                Text(
                  lookingFor.profile.firstName +
                      ' ' +
                      lookingFor.profile.lastName,
                  style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text('Matt'),
                  icon: const Icon(Icons.people),
                ),
                IconButton(
                  icon: const Icon(Icons.mail),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
