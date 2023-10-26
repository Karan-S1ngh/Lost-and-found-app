import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            PrivacyPolicySection(
              title: 'Privacy Concerns',
              content:
                  'Traditional systems may require users to share personal information, raising privacy concerns. Our university-specific app can use secure university IDs for authentication, enhancing user privacy.',
            ),
            PrivacyPolicySection(
              title: 'False Reports',
              content:
                  'Traditional systems may lack accountability, allowing for false reports. By tying users to university IDs, our app discourages false claims and can impose consequences for dishonest reporting.',
            ),
            PrivacyPolicySection(
              title: 'Limited Geographic Scope',
              content:
                  'Traditional lost and found services often cover larger areas, making them less efficient for campus-specific needs. Our app focuses exclusively on the university campus, enhancing efficiency.',
            ),
            PrivacyPolicySection(
              title: 'User Experience',
              content:
                  'Some traditional systems have clunky user interfaces, which can discourage users. Our app\'s categorized search feature simplifies item retrieval and improves user experience.',
            ),
            PrivacyPolicySection(
              title: 'User Feedback',
              content:
                  'Traditional systems may not have mechanisms for user feedback. Our app can include feedback features for continuous improvement.',
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicySection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Text(content),
        const SizedBox(height: 20),
      ],
    );
  }
}
