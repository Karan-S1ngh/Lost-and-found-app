import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profilepic;

  // Function to sign out the user
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
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
        backgroundColor: Color.fromARGB(255, 232, 176, 250),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoButton(
              onPressed: () async {
                XFile? selectedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

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
                backgroundColor: Color.fromARGB(255, 247, 196, 247),
              ),
            ),
            const Text(
              'Welcome User!', // Display user's name here
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            ElevatedButton(
              onPressed: () => _signOut(context),
              child: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(
                    255, 255, 17, 0), // Set sign-out button color to red
              ),
            ),
          ],
        ),
      ),
    );
  }
}
