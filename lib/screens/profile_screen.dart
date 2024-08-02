import 'package:flutter/material.dart';

import 'package:like_minds/models/profile.dart';
import 'package:like_minds/widgets/profile_widgets/about.dart';
import 'package:like_minds/widgets/profile_widgets/interests_list.dart';
import 'package:like_minds/widgets/profile_widgets/profile_image.dart';

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
            ProfileImage(
                firstName: widget.profile.firstName,
                lastName: widget.profile.lastName,
                image: 'lib/images/me.jpg'),
            const SizedBox(height: 30),
            Text(
              'Home: ' + widget.profile.location,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            InterestsList(interests: widget.profile.interests),
            const SizedBox(height: 30),
            About(about: widget.profile.about),
          ],
        ),
      ),
    );
  }
}
