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
        child: Text('About Us Content Goes Here'),
      ),
    );
  }
}
