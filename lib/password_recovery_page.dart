// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                'Password reset link sent! Check your email.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Password Recovery'),
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 109, 57, 199),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock_outline_sharp, size: 115, color: Colors.grey),
          const SizedBox(height: 9),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                Text(
                  'Forgot Password ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your email and we will send you a password reset link',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          // EMAIL INPUT FIELD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(179, 196, 196, 196)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: const Color.fromARGB(255, 240, 236, 236),
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 18),
          MaterialButton(
            onPressed: passwordReset,
            color: const Color.fromARGB(255, 109, 57, 199),
            height: 47,
            child: const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
