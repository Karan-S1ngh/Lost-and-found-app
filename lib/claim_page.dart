import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClaimPageState createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  final TextEditingController claimedItemColorController =
      TextEditingController();
  final TextEditingController claimedItemBrandController =
      TextEditingController();
  final TextEditingController claimedItemModelController =
      TextEditingController();
  final TextEditingController claimedItemMarkController =
      TextEditingController();
  final TextEditingController claimedItemWallpaperController =
      TextEditingController();
  final TextEditingController claimedItemTimeController =
      TextEditingController();
  final TextEditingController claimedItemLocationController =
      TextEditingController();

  late DatabaseReference _database;
  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 172, 102),
        title: const Text('Claimed Item Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Claimed Item'),
              TextFormField(
                controller: claimedItemColorController,
                decoration: const InputDecoration(
                  labelText: 'Color of item',
                ),
              ),
              TextFormField(
                controller: claimedItemBrandController,
                decoration: const InputDecoration(
                  labelText: 'Brand',
                ),
              ),
              TextFormField(
                controller: claimedItemModelController,
                decoration: const InputDecoration(
                  labelText: 'Model',
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
              MaterialButton(
                onPressed: () async {
                  // Get the data from the form controllers

                  // Create a map to store the claimed item details
                  Map<String, String> claimedItemData = {
                    'itemColor': claimedItemColorController.text,
                    'brand': claimedItemBrandController.text,
                    'model': claimedItemModelController.text,
                    'identifyingMark': claimedItemMarkController.text,
                    'wallpaperImage': claimedItemWallpaperController.text,
                    'time': claimedItemTimeController.text,
                    'location': claimedItemLocationController.text,
                  };

                  // Send the claimed item data to Firebase Realtime Database
                  try {
                    await _database
                        .child("claimedItemData")
                        .push()
                        .set(claimedItemData);
                  } catch (e) {
                    log(e.toString());
                  }

                  // Provide feedback to the user
                  if (context.mounted) {
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
                  }
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Submit Claimed Item',
                  style: TextStyle(
                      color:
                          Colors.white), // This changes the color of the text
                ),
                color: const Color.fromARGB(255, 102, 140,
                    147), // This changes the background color of the button
              ),
            ],
          ),
        ),
      ),
    );
  }
}
