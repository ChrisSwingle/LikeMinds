import 'package:flutter/material.dart';

class LookingForScreen extends StatefulWidget {
  const LookingForScreen({super.key});

  @override
  State<LookingForScreen> createState() {
    return _LookingForScreenState();
  }
}

class _LookingForScreenState extends State<LookingForScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            'Looking for',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
