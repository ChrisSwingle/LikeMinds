import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key, required this.about});

  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white, width: 2.0), // Outline color and width
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'About',
              // textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              about,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
