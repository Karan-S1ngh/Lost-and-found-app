import 'package:flutter/material.dart';
import 'package:test/found_inform_cards.dart'; // Assuming this holds your FoundInformCards class

class ListViewOfFound extends StatefulWidget {
  const ListViewOfFound({super.key});

  @override
  State<ListViewOfFound> createState() => _ListViewOfFoundState();
}

class _ListViewOfFoundState extends State<ListViewOfFound> {
  final _searchTextController = TextEditingController();
  List<FoundInformCards> _allItems = []; // To store all found items
  List<FoundInformCards> _filteredItems = []; // To store filtered items

  @override
  void initState() {
    super.initState();
    // Assuming you have a way to fetch found items
    _allItems = [
      FoundInformCards(
        lostSince: "@lostSince",
        location1: "location1 of Found Item 1",
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
      ),
      FoundInformCards(
        lostSince: "@lostSince",
        location1: "location1 of Found Item 2",
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
      ),
      FoundInformCards(
        lostSince: "@Username3",
        location1: "location1 of Found Item 3",
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
      ),
      FoundInformCards(
        lostSince: "@Username4",
        location1: "location1 of Found Item 4",
      ),
    ];
    _filteredItems = _allItems; // Initially show all items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Avoids top padding on some devices
        child: Column(
          children: [
            // Add top padding to the Column
            Padding(
              padding: const EdgeInsets.only(top: 16.0), // Adjust top padding as needed
              child: Row( // Use Row for horizontal placement
                children: [
                  Expanded( // Ensures search bar fills all horizontal space
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _searchTextController,
                        decoration: InputDecoration(
                          hintText: 'Search Found Items',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white, // Solid background color
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0), // Rounded corners
                          ),
                        ),
                        onChanged: (value) => _filterFoundItems(value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0), // Add some spacing
            Expanded( // Ensures list view fills remaining space
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  // Add spacing before the first item only
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0), // Adjust top padding as needed
                      child: _filteredItems[index],
                    );
                  }
                  return _filteredItems[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterFoundItems(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _filteredItems = _allItems; // Show all items if search text is empty
      });
      return;
    }

    final lowercaseSearchText = searchText.toLowerCase();
    final filteredItems = _allItems.where((item) =>
        item.lostSince.toLowerCase().contains(lowercaseSearchText) ||
        item.location1.toLowerCase().contains(lowercaseSearchText));

    setState(() {
      _filteredItems = filteredItems.toList(); // Update filtered items
    });
  }
}
