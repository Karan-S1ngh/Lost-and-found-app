import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const SingleChildScrollView(
          child: Center(
            child: Text(
              'About Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
            "Welcome To the ultimate lost and found solution. We're on a mission to simplify the process of reuniting people with their lost belongings. With our user-friendly app, reporting lost items takes seconds, and finding what you've lost is just as easy. We connect responsible finders with grateful owners, ensuring a smooth return process. Your privacy is our priority, and your personal information is secure. Join our growing community of caring individuals and experience the satisfaction of reuniting lost items with their rightful owners."),
      ),
    );
  }
}
