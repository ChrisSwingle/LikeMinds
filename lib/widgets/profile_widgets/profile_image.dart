import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.image});

  final String firstName;
  final String lastName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'lib/images/me.jpg',
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Text(
            firstName + ' ' + lastName,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        )
      ],
    );
  }
}
