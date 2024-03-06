import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
        foregroundColor: Colors.white,
        title: const Text(
          'Privacy Policy',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrivacyPolicySection(
                title: 'Privacy Concerns',
                content:
                    "Traditional systems may require users to share personal information, raising privacy concerns. Our university-specific app can use secure university IDs for authentication, enhancing user privacy.",
              ),
              const PrivacyPolicySection(
                title: 'Accountability and False Reports',
                content:
                    "Traditional systems may lack accountability, allowing for false reports. By tying users to university IDs, our app discourages false claims and can impose consequences for dishonest reporting.",
              ),
              const PrivacyPolicySection(
                title: 'Efficiency and Geographic Scope',
                content:
                    "Traditional lost and found services often cover larger areas, making them less efficient for campus-specific needs. Our app focuses exclusively on the university campus, enhancing efficiency.",
              ),
              const PrivacyPolicySection(
                title: 'User Experience and Feedback',
                content:
                    "Some traditional systems have clunky user interfaces, which can discourage users. Our app's categorized search feature simplifies item retrieval and improves user experience. It also includes feedback features for continuous improvement.",
              ),
              const SizedBox(height: 30),
              Text(
                "Your privacy and satisfaction are our top priorities. If you have any concerns or suggestions regarding our privacy policy, please contact us.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PrivacyPolicySection({super.key,required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 109, 57, 199),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
