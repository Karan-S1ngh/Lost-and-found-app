import 'package:flutter/material.dart';

class FoundPage extends StatefulWidget {
  const FoundPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoundPageState createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  final TextEditingController foundItemDescriptionController =
      TextEditingController();
  final TextEditingController foundItemMarkController = TextEditingController();
  final TextEditingController foundItemWallpaperController =
      TextEditingController();
  final TextEditingController foundItemTimeController = TextEditingController();
  final TextEditingController foundItemLocationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Text('Found Item Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Found Item'),
              TextFormField(
                controller: foundItemDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Item Description (Color, Brand, Model)',
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
                  // Implement your logic for handling found items here
                  // You can access the text entered in the controllers
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 182, 4, 242),
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
