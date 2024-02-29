//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/components/square_tile.dart';
import 'package:test/first_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  //chatgpt didn't have lines from 12-13
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
    // ignore: unused_local_variable
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      _showSnackBar('Please fill in all the fields.');
      return;
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / 414;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 122, 86, 134),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(24 * fem, 65 * fem, 24 * fem, 22 * fem),
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25 * fem),
                    width: 29 * fem,
                    height: 21 * fem,
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                ),
                SizedBox(height: 6 * fem),
                Container(
                  margin: EdgeInsets.only(bottom: 7 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 7 * fem),
                        child: Text(
                          'Welcome !',
                          style: GoogleFonts.inter(
                            fontSize: 35 * fem,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    'Create new account',
                    style: GoogleFonts.inter(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),

                // const SizedBox(height: 45),
                _buildInputField('EMAIL', fem),
                SizedBox(height: 24 * fem),
                _buildInputField('USERNAME', fem),
                SizedBox(height: 24 * fem),
                _buildInputField('PASSWORD', fem, isPassword: true),
                SizedBox(height: 22 * fem),
                _buildSignUpButton(fem, context),
                SizedBox(height: 14 * fem),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 19.5),
                    ),
                    // clicking on login in sign up page
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginInPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 109, 57, 199),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25 * fem),
                // or login with google or apple
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.4,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          " Or Sign Up with ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 112, 111, 111),
                              fontSize: 17),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 19),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/google.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double fem, {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20 * fem),
      child: TextField(
        controller: isPassword
            ? _passwordController
            : (label == 'EMAIL' ? _emailController : _usernameController),
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 18 * fem,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF000000),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 18 * fem,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF000000)),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(double fem, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60 * fem,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 109, 57, 199),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: ElevatedButton(
        onPressed: () {
          _handleSignUp();
        },
        // ignore: sort_child_properties_last
        child: Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22 * fem,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
