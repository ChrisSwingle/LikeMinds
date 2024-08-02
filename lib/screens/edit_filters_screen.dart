import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_minds/models/interests.dart';
import 'package:like_minds/providers/filters_provider.dart';
import 'package:like_minds/widgets/profile_widgets/interest_bubble.dart';

class EditFiltersScreen extends ConsumerStatefulWidget {
  const EditFiltersScreen({super.key});

  @override
  ConsumerState<EditFiltersScreen> createState() {
    return _EditFiltersScreenState();
  }
}

class _EditFiltersScreenState extends ConsumerState<EditFiltersScreen> {
  var _filteredInterestsModel = availableInterestsModel;

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

  void _confirmFilters(List<Interest> filters) {
    ref.read(filtersProvider.notifier).setFilters(filters);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filters confirmed!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _back() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var filters = ref.watch(filtersProvider);

    void removeFilter(Interest interest) {
      filters.remove(interest);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: _back,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 350,
                child: GridView.builder(
                  itemCount: filters.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          removeFilter(filters[index]);
                        },
                        child: InterestBubble(
                            title: filters[index].name.toString()),
                      )),
                    );
                  },
                ),
              ),
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
                itemCount: _filteredInterestsModel.length,
                itemBuilder: (context, index) {
                  final interest = _filteredInterestsModel[index].interest;
                  final isSelected = filters.contains(interest);
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
                              filters.remove(interest);
                            } else if (filters.length < 6) {
                              filters.add(interest);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You can select up to 6 interests only'),
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _confirmFilters(filters);
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
                'Confirm Filters',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
