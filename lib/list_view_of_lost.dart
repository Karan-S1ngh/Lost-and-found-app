import 'package:flutter/material.dart';
import 'package:test/lost_inform_cards.dart';

class ListViewOfLost extends StatefulWidget {
  const ListViewOfLost({super.key});

  @override
  State<ListViewOfLost> createState() => _ListViewOfLostState();
}

class _ListViewOfLostState extends State<ListViewOfLost> {
  String searchText = ''; // Stores the current search term

  List<LostInformCards> lostItems = [
    const LostInformCards(
      username: "@Username1",
      title: "Title of Lost Item 1",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
    ),
    const LostInformCards(
      username: "@Username2",
      title: "Title of Lost Item 2",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
    ),
    const LostInformCards(
      username: "@Username3",
      title: "Title of Lost Item 3",
      imageUrl:
          "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
    ),
    const LostInformCards(
      username: "@Username4",
      title: "Title of Lost Item 4",
    ),
  ];

  List<LostInformCards> filteredItems = []; // Stores the filtered list

  @override
  void initState() {
    super.initState();
    filteredItems = lostItems; // Initially show all items
  }

  void filterItems(String searchTerm) {
    filteredItems = lostItems
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
