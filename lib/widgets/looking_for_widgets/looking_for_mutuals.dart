import 'package:flutter/material.dart';
import 'package:like_minds/widgets/looking_for_widgets/mutuals_list.dart';

class LookingForMutuals extends StatelessWidget {
  const LookingForMutuals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(children: [
      Text(
        "Mutuals",
        style: TextStyle(color: Colors.white),
      ),
      MutualsList()
    ]));
  }
}
