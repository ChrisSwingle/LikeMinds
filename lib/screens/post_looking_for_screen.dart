import 'package:flutter/material.dart';

class PostLookingForScreen extends StatefulWidget {
  const PostLookingForScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PostLookingForScreenState();
  }
}

class _PostLookingForScreenState extends State<PostLookingForScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'Post to looking for',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
