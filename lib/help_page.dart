import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  final String email = 'lostfoundspprt12@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
        title: const Text(
          'Help',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.help,
                size: 80,
                color: Color.fromARGB(255, 238, 172, 102),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to our Help Center!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'If you need assistance, please feel free to write to us at ',
                    ),
                    TextSpan(
                      text: email,
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          final Uri _emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: email,
                              queryParameters: {'cc': email});
                          launch(_emailLaunchUri.toString());
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
