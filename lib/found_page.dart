import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FoundPage extends StatefulWidget {
  const FoundPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoundPageState createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  final TextEditingController claimedItemColorController =
      TextEditingController();
  final TextEditingController claimedItemBrandController =
      TextEditingController();
  final TextEditingController claimedItemModelController =
      TextEditingController();
  final TextEditingController foundItemMarkController = TextEditingController();
  final TextEditingController foundItemWallpaperController =
      TextEditingController();
  final TextEditingController foundItemTimeController = TextEditingController();
  final TextEditingController foundItemLocationController =
      TextEditingController();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 172, 102),
        title: const Text('Found Item Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Found Item'),
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
                controller: foundItemMarkController,
                decoration: const InputDecoration(
                  labelText: 'Identifying Mark',
                ),
              ),
              TextFormField(
                controller: foundItemWallpaperController,
                decoration: const InputDecoration(
                  labelText: 'Wallpaper or Homepage Screen Image',
                ),
              ),
              TextFormField(
                controller: foundItemTimeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                ),
              ),
              TextFormField(
                controller: foundItemLocationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Get the data from the form controllers
                  String itemColor = claimedItemColorController.text;
                  String brand = claimedItemBrandController.text;
                  String model = claimedItemModelController.text;
                  String identifyingMark = foundItemMarkController.text;
                  String wallpaperImage = foundItemWallpaperController.text;
                  String time = foundItemTimeController.text;
                  String location = foundItemLocationController.text;

                  // Create a map to store the claimed item details
                  Map<String, dynamic> foundItemData = {
                    'itemColor': itemColor,
                    'brand': brand,
                    'model': model,
                    'identifyingMark': identifyingMark,
                    'wallpaperImage': wallpaperImage,
                    'time': time,
                    'location': location,
                  };

                  // Send the claimed item data to Firebase Realtime Database
                  _database.child("foundItems").push().set(foundItemData);

                  // Provide feedback to the user
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Found Item Submitted"),
                        content: const Text(
                            "Your found item details have been submitted successfully!"),
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
                  backgroundColor: const Color.fromARGB(255, 102, 140, 147),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Submit Found Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
