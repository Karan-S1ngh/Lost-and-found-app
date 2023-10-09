import 'package:flutter/material.dart';

class ClaimPage extends StatelessWidget {
  final String itemName;
  final String username;
  final String imageUrl;

  const ClaimPage({
    Key? key,
    required this.itemName,
    required this.username,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Claim Item'),
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Item: $itemName',
              style: const TextStyle(fontSize: 20),
            ),
            // Add your claim logic and UI components here
          ],
        ),
      ),
    );
  }
}
