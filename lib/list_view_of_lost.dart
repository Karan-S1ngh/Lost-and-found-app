import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/lost_inform_cards.dart';
import 'package:test/services/database.dart';
import 'package:intl/intl.dart';

class ListViewOfLost extends StatefulWidget {
  const ListViewOfLost({Key? key}) : super(key: key);

  @override
  _ListViewOfLostState createState() => _ListViewOfLostState();
}

class _ListViewOfLostState extends State<ListViewOfLost> {
  late Stream<QuerySnapshot> lostItemStream;
  String searchTerm = ''; // Store the search term
  final TextEditingController _searchController =
      TextEditingController(); // New controller

  @override
  void initState() {
    super.initState();
    getLostItems(); // Fetch lost items from Firestore
  }

  // Method to fetch lost items from Firestore
  void getLostItems() {
    final databaseMethods = DatabaseMethods();
    lostItemStream = databaseMethods.getItems(); // No need to await here
  }

  void filterItems(String term) {
    setState(() {
      searchTerm = term.toLowerCase(); // Lowercase for case-insensitive search
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Avoids top padding on some devices
        child: Column(
          children: [
            // Add top padding to the Column
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0, // Adjust top padding as needed
              ),
              child: Row(
                // Use Row for horizontal placement
                children: [
                  Expanded(
                    // Ensures search bar fills all horizontal space
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _searchController, // Use the controller
                        onChanged: (value) => filterItems(value),
                        decoration: InputDecoration(
                          hintText: 'Search Lost Items',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors
                              .white, // Adjust fillColor for better contrast if needed
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0), // Add some spacing
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: lostItemStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final List<QueryDocumentSnapshot> documents =
                        snapshot.data!.docs;
                    final filteredDocs = searchTerm.isEmpty
                        ? documents
                        : documents
                            .where((doc) => _matchesSearchTerm(doc))
                            .toList();

                    return ListView.builder(
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot ds = filteredDocs[index];
                        return LostInformCards(
                          lostSince: ds['lostSince'] != null
                              ? DateFormat('MMM dd, yyyy').format(
                                  (ds['lostSince'] as Timestamp).toDate())
                              : 'Unknown date',
                          brand: ds['brand'],
                          category: ds['category'],
                          colour: ds['colour'],
                          location1: ds['location1'],
                          location2: ds['location2'],
//                          imageUrl: ds['imageUrl'], // Uncomment if you have image URLs
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _matchesSearchTerm(DocumentSnapshot doc) {
    final String lowerCaseTerm = searchTerm;
    final String lowerCaseBrand = doc['brand'].toString().toLowerCase();
    final String lowerCaseCategory = doc['category'].toString().toLowerCase();
    final String lowerCaseColour = doc['colour'].toString().toLowerCase();
    final String lowerCaseDate = doc['lostSince'] != null
        ? DateFormat('MMM dd, yyyy')
            .format((doc['lostSince'] as Timestamp).toDate())
            .toLowerCase()
        : 'Unknown date';

    return lowerCaseBrand.contains(lowerCaseTerm) ||
        lowerCaseCategory.contains(lowerCaseTerm) ||
        lowerCaseColour.contains(lowerCaseTerm) ||
        lowerCaseDate.contains(lowerCaseTerm);
  }
}
