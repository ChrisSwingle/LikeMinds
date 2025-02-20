import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import 'package:like_minds/models/looking_for.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';
import 'package:like_minds/providers/looking_for_provider.dart';
import 'package:like_minds/models/dummy_data.dart';
import 'package:like_minds/models/interests.dart';

class PostLookingForScreen extends ConsumerStatefulWidget {
  const PostLookingForScreen({super.key});

  @override
  ConsumerState<PostLookingForScreen> createState() {
    return _PostLookingForScreen();
  }
}

class _PostLookingForScreen extends ConsumerState<PostLookingForScreen> {
  final _formKey = GlobalKey<FormState>();

  final _interestsStr =
      Interest.values.map((e) => e.toString().split('.').last).toList();
  var _filteredInterestsModel = availableInterestsModel;

  String? _selectedInterests;
  final TextEditingController _controllerInterest = TextEditingController();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerSummary = TextEditingController();

  void _filterOptions(String query) {
    setState(() {
      _filteredInterestsModel = availableInterestsModel.where((interestModel) {
        bool interestContainsVal = interestModel.interest
            .toString()
            .split('.')
            .last
            .toLowerCase()
            .contains(query);
        bool categoriesContainsVal = interestModel.categories.map((category) {
          return category.toString().split('.').last.toLowerCase();
        }).contains(query);

        return interestContainsVal || categoriesContainsVal;
      }).toList();
    });
  }

  void _confirmLookingFor() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showConfirmationDialog(context);
    }
  }

  Interest strToInterest(String str) {
    return Interest.values
        .firstWhere((e) => e.toString() == 'Interests.' + str);
  }

  void _saveLookingFor() {
    ref.read(lookingForProvider.notifier).addLookingFor(
          LookingFor(
            profile: tempProfile,
            title: _controllerTitle.text,
            summary: _controllerSummary.text,
            interest: strToInterest(_selectedInterests!),
          ),
        );
    _controllerTitle.clear();
    _controllerSummary.clear();
    _controllerInterest.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _controllerTitle,
              maxLength: 30,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              validator: (value) {
                if (value == null || value == '') {
                  return 'Must enter a valid title';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerSummary,
              inputFormatters: [
                CombinedInputFormatter(4, 168, 42),
              ],
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Summary',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a summary';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerInterest,
              decoration: const InputDecoration(
                labelText: 'Search Interests',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterOptions,
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value == '' || value == null) {
                  return 'Do not forget to enter an interest';
                }

                if (!_interestsStr.contains(value)) {
                  return 'Make sure you chose a valid interest';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredInterestsModel.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 300,
                      child: ListTile(
                        title: InterestBubble(
                            title: _filteredInterestsModel[index]
                                .interest
                                .name
                                .toString()),
                        onTap: () {
                          setState(() {
                            _selectedInterests = _filteredInterestsModel[index]
                                .interest
                                .name
                                .toString();
                            _controllerInterest.text = _selectedInterests!;
                            _filteredInterestsModel =
                                availableInterestsModel; // Reset the filtered list
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _confirmLookingFor();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                side: const BorderSide(
                    color: Colors.white, width: 2), // Border color and width
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Padding
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Confirm Post',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Are you sure you want to post to looking for?',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                _saveLookingFor();
                Navigator.of(context).pop(); // Close the dialog
                // Add your post action here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Post confirmed!'),
                  ),
                );
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CombinedInputFormatter extends TextInputFormatter {
  final int maxNewLines;
  final int maxTotalCharacters;
  final int enterEquivalentLength;

  CombinedInputFormatter(
      this.maxNewLines, this.maxTotalCharacters, this.enterEquivalentLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Count the number of newline characters in the new value
    final newlineCount = '\n'.allMatches(newValue.text).length;

    // Calculate the total length of the text, treating each newline as enterEquivalentLength characters
    final totalLength =
        newValue.text.length + (newlineCount * (enterEquivalentLength - 1));

    if (newlineCount > maxNewLines || totalLength > maxTotalCharacters) {
      // If the number of newlines or total length exceeds the max allowed, return the old value
      return oldValue;
    }
    return newValue;
  }
}
