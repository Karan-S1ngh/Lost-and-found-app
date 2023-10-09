//Claimed Item Page:
import 'package:flutter/material.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

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
                  // Implement your logic for handling claimed items here
                  // You can access the text entered in the controllers
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
