import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/first_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleSignUp() async {
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      saveUserData();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );

      // User created successfully, you can handle the navigation or additional tasks here.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showSnackBar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showSnackBar('The account already exists for that email.');
      } else {
        _showSnackBar('Error during sign up: $e');
      }
    } catch (e) {
      _showSnackBar('Error during sign up: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void saveUserData() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    if (username != "" && email != "") {
      Map<String, dynamic> userData = {"name": username, "email": email};
      FirebaseFirestore.instance.collection("users").add(userData);
      log("User created");
    } else {
      log("please fill all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 122, 86, 134),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 237, 206, 247),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'NEW ACCOUNT',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 45),
                _buildInputField('EMAIL'),
                const SizedBox(height: 35),
                _buildInputField('USERNAME'),
                const SizedBox(height: 45),
                _buildInputField('PASSWORD', isPassword: true),
                const SizedBox(height: 50),
                _buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {bool isPassword = false}) {
    return SizedBox(
      width: 320,
      height: 50,
      child: TextField(
        controller: isPassword
            ? _passwordController
            : (label == 'EMAIL' ? _emailController : _usernameController),
        obscureText: isPassword,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF000000),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF000000)),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: _handleSignUp,
        child: const Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
