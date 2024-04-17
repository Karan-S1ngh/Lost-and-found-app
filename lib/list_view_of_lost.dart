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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: lostItemStream,
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
            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot ds = documents[index];
                return LostInformCards(
                  lostSince: DateFormat('MMM dd, yyyy')
                      .format(ds['lostSince'].toDate()),
                  brand: ds['brand'], // Fetch brand from Firestore
                  category: ds['category'], // Fetch category from Firestore
                  colour: ds['colour'],
                  location1: ds['location1'],
                  location2: ds['location2'],
                  // imageUrl: ds['imageUrl'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
