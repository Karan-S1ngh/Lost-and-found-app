// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profilepic;

  //current user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // Function to sign out the user
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
    } catch (e) {
      print("Error during sign out: $e");
      // Handle sign-out errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
        foregroundColor: Colors.white,
        title: const Text(
          'Profile Page',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(25.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () async {
                  XFile? selectedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (selectedImage != null) {
                    File convertedFile = File(selectedImage.path);
                    setState(() {
                      profilepic = convertedFile;
                    });
                    print("image selected!");
                  } else {
                    print("no image selected");
                  }
                },
                padding: EdgeInsets.zero,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      (profilepic != null) ? FileImage(profilepic!) : null,
                  backgroundColor: const Color.fromARGB(255, 159, 158, 158),
                  child: (profilepic == null)
                      ? const Icon(Icons.person, size: 80, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                currentUser
                    .email!, // Display username here instead of user email. First store username in db first
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle "Contact Us" button tap
                  // You can navigate to a contact form or contact details page
                },
                child: const Text('Contact Us'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _signOut(context),
                icon: const Icon(Icons.logout),
                // ignore: sort_child_properties_last
                label: const Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 17, 0), // Set sign-out button color to red
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
