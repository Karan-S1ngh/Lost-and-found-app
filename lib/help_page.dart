import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Text(
          'Help',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'How to Use This App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Text('1.'),
                title: Text(
                  'To report a lost item, go to the Lost Items page and click on the "Report Lost Item" button.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Text('2.'),
                title: Text(
                  'Fill in the required details, including a detailed description of the lost item, its color, and any identifying marks. Then, submit the report.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Text('3.'),
                title: Text(
                  'To report a found item, go to the Found Items page and click on the "Report Found Item" button.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Text('4.'),
                title: Text(
                  'Fill in the required details, including information about the found item, where you found it, and any relevant identifying marks. Then, submit the report.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'For more information and assistance, please contact our support team at support@example.com.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
