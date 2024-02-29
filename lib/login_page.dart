import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/home_page.dart';
import 'package:logger/logger.dart';
import 'password_recovery_page.dart';
import 'signup_page.dart';

class LoginInPage extends StatelessWidget {
  LoginInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final logger = Logger();

  Future<void> _handleLogin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential.user != null) {
        // User logged in successfully, navigate to home page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      // Handle login errors (e.g., invalid credentials)
      logger.d("Error during login: $e");
      // You can show an error message to the user here if you want
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / 414; // Assuming design width is 414

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 182, 4, 242),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(22 * fem, 65 * fem, 22 * fem, 199 * fem),
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

                SizedBox(height: 10 * fem),
                Container(
                  margin: EdgeInsets.only(bottom: 10 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 9 * fem),
                        child: Text(
                          'Welcome Back !',
                          style: GoogleFonts.inter(
                            fontSize: 35 * fem,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.96 * fem),
                        width: 26.96 * fem,
                        height: 26.96 * fem,
                        child: const Icon(
                          Icons.waving_hand,
                          color: Color.fromARGB(255, 255, 193, 24),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25 * fem),
                  child: Text(
                    'Sign In to your account',
                    style: GoogleFonts.inter(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                // // SizedBox(height: 50 * fem),
                _buildInputField('EMAIL', fem),
                SizedBox(height: 40 * fem),
                _buildInputField('PASSWORD', fem, isPassword: true),
                SizedBox(height: 30 * fem),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PasswordRecoveryPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 20 * fem,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20 * fem),
                _buildLoginInButton(fem, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double fem, {bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22 * fem),
      child: TextField(
        controller: isPassword ? _passwordController : _emailController,
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

  Widget _buildLoginInButton(double fem, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60 * fem,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 109, 57, 199),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: ElevatedButton(
        onPressed: () {
          _handleLogin(context);
        },
        // ignore: sort_child_properties_last
        child: Text(
          'LOG IN',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25 * fem,
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
