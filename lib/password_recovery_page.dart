import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatelessWidget {
    const PasswordRecoveryPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Recovery'),
      ),
      body: const Center(
        child: Text('Password recovery screen content goes here.'),
      ),
    );
  }
}
