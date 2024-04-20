import 'package:flutter/material.dart';
import 'package:test/found_inform_cards.dart'; // Assuming this holds your FoundInformCards class
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:test/services/database.dart';

class ListViewOfFound extends StatefulWidget {
  const ListViewOfFound({super.key});

  @override
  State<ListViewOfFound> createState() => _ListViewOfFoundState();
}

class _ListViewOfFoundState extends State<ListViewOfFound> {
  late Stream<QuerySnapshot> foundItemStream;
  String searchTerm = ''; // Store the search term
  final TextEditingController _searchController =
      TextEditingController(); // New controller

  @override
  void initState() {
    super.initState();
    getFoundItems(); // Fetch found items from Firestore
  }

  // Method to fetch found items from Firestore
  void getFoundItems() {
    final databaseMethods = DatabaseMethods();
    foundItemStream = databaseMethods.getFoundItems(); // No need to await here
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
                  top: 16.0), // Adjust top padding as needed
              child: Row(
                // Use Row for horizontal placement
                children: [
                  Expanded(
                    // Ensures search bar fills all horizontal space
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) => filterItems(value),
                        decoration: InputDecoration(
                          hintText: 'Search Found Items',
                          prefixIcon: const Icon(Icons.search),
                          fillColor: Colors.white, // Solid background color
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
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
              // Ensures list view fills remaining space
              child: StreamBuilder<QuerySnapshot>(
                stream: foundItemStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
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
                        return FoundInformCards(
                          foundOn: ds['foundOn'] != null
                              ? DateFormat('MMM dd, yyyy')
                                  .format((ds['foundOn'] as Timestamp).toDate())
                              : 'Unknown date',
                          brand: ds['brand'], // Fetch brand from Firestore
                          category:
                              ds['category'], // Fetch category from Firestore
                          colour: ds['colour'],
                          location1: ds['location1'],
                          // imageUrl: ds['imageUrl'],
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
    final String lowerCaseDate = doc['foundOn'] != null
        ? DateFormat('MMM dd, yyyy')
            .format((doc['foundOn'] as Timestamp).toDate())
            .toLowerCase()
        : 'Unknown date';

    return lowerCaseBrand.contains(lowerCaseTerm) ||
        lowerCaseCategory.contains(lowerCaseTerm) ||
        lowerCaseColour.contains(lowerCaseTerm) ||
        lowerCaseDate.contains(lowerCaseTerm);
  }
}
