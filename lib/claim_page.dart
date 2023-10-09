import 'package:flutter/material.dart';

class ClaimQuestionnairePage extends StatelessWidget {
  const ClaimQuestionnairePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim Questionnaire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your questionnaire questions and input fields here
            const Text('Question 1:'),
            // Add your input fields and other questions here

            ElevatedButton(
              onPressed: () {
                // Handle form submission logic here
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
