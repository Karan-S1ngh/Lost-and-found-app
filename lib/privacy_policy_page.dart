import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const SingleChildScrollView(
          child: Center(
            child: Text(
              'Privacy Policy',
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
            "Privacy Concerns: Traditional systems may require users to share personal information, raising privacy concerns. Our university-specific app can use secure university IDs for authentication, enhancing user privacy. False Reports: Traditional systems may lack accountability, allowing for false reports. By tying users to university IDs, our app discourages false claims and can impose consequences for dishonest reporting.Limited Geographic Scope: Traditional lost and found services often cover larger areas, making them less efficient for campus-specific needs. Our app focuses exclusively on the university campus, enhancing efficiency.User Experience: Some traditional systems have clunky user interfaces, which can discourage users. Our app's categorized search feature simplifies item retrieval and improves user experience.User Feedback: Traditional systems may not have mechanisms for user feedback. Our app can include feedback features for continuous improvement."),
      ),
    );
  }
}
