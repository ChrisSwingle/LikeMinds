import 'package:flutter/material.dart';

class InterestBubble extends StatelessWidget {
  const InterestBubble({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 12.0), // Padding inside the bubble
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the bubble
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
        border: Border.all(
            color: Colors.black, width: 2.0), // Border around the bubble
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black, // Text color
          fontSize: 10, // Text size
          fontWeight: FontWeight.bold, // Text weight
        ),
      ),
    );
  }
}
