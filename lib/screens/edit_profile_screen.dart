import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:like_minds/models/profile.dart';
import 'package:like_minds/providers/profile_provider.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() {
    return _EditProfileScreen();
  }
}

class _EditProfileScreen extends ConsumerState<EditProfileScreen> {
  late final Profile profile;

  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profile = ref.read(profileProvider);
    _controllerFirstName.text = profile.firstName;
    _controllerLastName.text = profile.lastName;
    _controllerAbout.text = profile.about;
    _controllerLocation.text = profile.location;
    profileInterests = profile.interest;
  }

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerAbout = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  final TextEditingController _controllerInterests = TextEditingController();
  List<Interests> profileInterests = [];
  String imageLink = '';
  List<Interests> _interests = Interests.values;

  void back() {
    Navigator.of(context).pop();
  }

  void _confirmEdit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(profileProvider.notifier).changeProfile(Profile(
          firstName: _controllerFirstName.text,
          lastName: _controllerLastName.text,
          location: _controllerLocation.text,
          about: _controllerAbout.text,
          interest: profileInterests,
          imageLink: 'lib/images/me.jpg',
          links: profile.links));
      // Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Edit confirmed!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _filterOptions(String query) {
    setState(() {
      _interests = Interests.values
          .where((option) => option.name.contains(query.toLowerCase()))
          .toList();
    });
  }

  void _removeInterest(Interests interest) {
    setState(() {
      profileInterests.remove(interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: back,
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _controllerFirstName,
                maxLength: 30,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  label: Text('First Name'),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Must enter a valid first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerLastName,
                maxLength: 30,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  label: Text('Last Name'),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Must enter a valid last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerLocation,
                maxLength: 30,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  label: Text('Location'),
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Must enter a valid location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerAbout,
                inputFormatters: [
                  CombinedInputFormatter(4, 168, 42),
                ],
                keyboardType: TextInputType.multiline,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'About',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an about text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 350,
                  child: GridView.builder(
                    itemCount: profileInterests.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 2 columns
                      childAspectRatio: 2.5, // Aspect ratio of each item
                      crossAxisSpacing: 0.1,
                      mainAxisSpacing: 1.0,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                            _removeInterest(profileInterests[index]);
                          },
                          child: InterestBubble(
                              title: profileInterests[index].name.toString()),
                        )),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // controller: _controllerInterests,
                decoration: const InputDecoration(
                  labelText: 'Search Interests',
                  border: OutlineInputBorder(),
                ),
                onChanged: _filterOptions,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _interests.length,
                  itemBuilder: (context, index) {
                    final interest = _interests[index];
                    final isSelected = profileInterests.contains(interest);
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 300,
                        child: ListTile(
                          title: InterestBubble(
                            title: interest.name.toString(),
                          ),
                          // tileColor:
                          //     isSelected ? Colors.blue.withOpacity(0.5) : null,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                profileInterests.remove(interest);
                              } else if (profileInterests.length < 6) {
                                profileInterests.add(interest);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'You can select up to 6 interests only'),
                                  ),
                                );
                              }
                              _controllerInterests.text =
                                  profileInterests.join(', ');
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _confirmEdit();
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
                  'Confirm Edit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
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
