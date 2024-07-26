import 'package:flutter/material.dart';

import 'package:like_minds/models/profile.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';

class InterestsList extends StatelessWidget {
  const InterestsList({super.key, required this.interests});

  final List<Interests> interests;

  @override
  Widget build(BuildContext context) {
    final int half = (interests.length / 2).ceil();

    return GridView.builder(
      itemCount: interests.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 2 columns
        childAspectRatio: 2.0, // Aspect ratio of each item
        crossAxisSpacing: 0.5,
        mainAxisSpacing: 1.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Center(
              child: InterestBubble(title: interests[index].name.toString())),
        );
      },
    );
  }
}
