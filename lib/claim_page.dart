import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClaimPageState createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  final TextEditingController claimedItemDescriptionController =
      TextEditingController();
  final TextEditingController claimedItemMarkController =
      TextEditingController();
  final TextEditingController claimedItemWallpaperController =
      TextEditingController();
  final TextEditingController claimedItemTimeController =
      TextEditingController();
  final TextEditingController claimedItemLocationController =
      TextEditingController();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Text('Claimed Item Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Claimed Item'),
              TextFormField(
                controller: claimedItemDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Item Description (Color, Brand, Model)',
                ),
              ),
              TextFormField(
                controller: claimedItemMarkController,
                decoration: const InputDecoration(
                  labelText: 'Identifying Mark',
                ),
              ),
              TextFormField(
                controller: claimedItemWallpaperController,
                decoration: const InputDecoration(
                  labelText: 'Wallpaper or Homepage Screen Image',
                ),
              ),
              TextFormField(
                controller: claimedItemTimeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                ),
              ),
              TextFormField(
                controller: claimedItemLocationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Get the data from the form controllers
                  String itemDescription =
                      claimedItemDescriptionController.text;
                  String identifyingMark = claimedItemMarkController.text;
                  String wallpaperImage = claimedItemWallpaperController.text;
                  String time = claimedItemTimeController.text;
                  String location = claimedItemLocationController.text;

                  // Create a map to store the claimed item details
                  Map<String, dynamic> claimedItemData = {
                    'itemDescription': itemDescription,
                    'identifyingMark': identifyingMark,
                    'wallpaperImage': wallpaperImage,
                    'time': time,
                    'location': location,
                  };

                  // Send the claimed item data to Firebase Realtime Database
                  _database.child("claimedItems").push().set(claimedItemData);

                  // Provide feedback to the user
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Claimed Item Submitted"),
                        content: const Text(
                            "Your claimed item details have been submitted successfully!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 182, 4, 242),
                ),
                child: const Text('Submit Claimed Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
