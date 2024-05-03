import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
        foregroundColor: Colors.white,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to the ultimate lost and found solution !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 28, 41, 66),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "We're dedicated to helping you find your lost items quickly and effortlessly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 19),
              const Text(
                "Key Features:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 109, 57, 199),
                ),
              ),
              const SizedBox(height: 10),
              const FeatureTile(
                icon: Icons.timer,
                text: "Report lost items instantly.",
              ),
              const FeatureTile(
                icon: Icons.search,
                text: "Effortlessly search for lost items.",
              ),
              const FeatureTile(
                icon: Icons.security,
                text: "Secure and private platform.",
              ),
              const FeatureTile(
                icon: Icons.people,
                text: "Connect with a caring community.",
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 102, 140, 147), // Button color
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    'Join Us',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color.fromARGB(255, 238, 172, 102), // Icon color
        size: 27,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
