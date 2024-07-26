import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:like_minds/models/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.profile});

  final Profile profile;

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                    widget.profile.firstName + ' ' + widget.profile.lastName,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Home: ' + widget.profile.location,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
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
              child: Column(
                children: [
                  const Text(
                    'About',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    widget.profile.about,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
