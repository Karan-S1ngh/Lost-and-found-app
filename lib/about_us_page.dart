import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        centerTitle: true, // Center the title in the app bar
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the Ultimate Lost and Found Solution',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "We're on a mission to simplify the process of reuniting people with their lost belongings. With our user-friendly app, reporting lost items takes seconds, and finding what you've lost is just as easy. We connect responsible finders with grateful owners, ensuring a smooth return process. Your privacy is our priority, and your personal information is secure. Join our growing community of caring individuals and experience the satisfaction of reuniting lost items with their rightful owners.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
