import 'package:flutter/material.dart';
import 'package:test/found_inform_cards.dart';

class ListViewOfFound extends StatefulWidget {
  const ListViewOfFound({super.key});

  @override
  State<ListViewOfFound> createState() => _ListViewOfFoundState();
}

class _ListViewOfFoundState extends State<ListViewOfFound> {
  String searchText = ''; // Stores the current search term

  List<FoundInformCards> foundItems = [
    const FoundInformCards(
      username: "@Username1",
      title: "Title of Found Item 1",
      imageUrl:
          "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    ),
    const FoundInformCards(
      username: "@Username2",
      title: "Title of Found Item 2",
      imageUrl:
          "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    ),
    const FoundInformCards(
      username: "@Username3",
      title: "Title of Found Item 3",
      imageUrl:
          "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    ),
    const FoundInformCards(
      username: "@Username4",
      title: "Title of Found Item 4",
    ),
  ];

  List<FoundInformCards> filteredItems = []; // Stores the filtered list

  @override
  void initState() {
    super.initState();
    filteredItems = foundItems; // Initially show all items
  }

  void filterItems(String searchTerm) {
    filteredItems = foundItems
        .where((item) =>
            item.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
            item.username.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
    setState(() {}); // Update UI to reflect the filtered list
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
                filterItems(searchText); // Filter on every character change
              });
            },
            decoration: const InputDecoration(
              hintText: 'Search by Username or Title',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: filteredItems.map((item) => item).toList(),
          ),
        ),
      ],
    );
  }
}
