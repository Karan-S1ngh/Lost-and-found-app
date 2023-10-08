import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
          color: Color.fromARGB(255, 182, 4, 242), // Desired background color here
        ),
        child: Container(
          padding:
              EdgeInsets.fromLTRB(0, screenHeight * 0.2, 0, screenHeight * 0.1),
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 127, 18, 163), // Desired color here
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'NEW ACCOUNT',
                  style: TextStyle(
                    fontSize: 35 * fem,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 45 * fem),
                _buildInputField('EMAIL', fem),
                SizedBox(height: 35 * fem),
                _buildInputField('USERNAME', fem),
                SizedBox(height: 45 * fem),
                _buildInputField1('PASSWORD', fem),
                SizedBox(height: 50 * fem),
                _buildSignUpButton(fem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double fem) {
    return SizedBox(
      width: 320 * fem,
      height: 50 * fem,
      child: TextField(
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

    Widget _buildInputField1(String label, double fem) {
    return SizedBox(
      width: 320 * fem,
      height: 50 * fem,
      child: TextField(
        obscureText: true,
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

  Widget _buildSignUpButton(double fem) {
    return Container(
      width: 320 * fem,
      height: 60 * fem,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: Center(
        child: Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22 * fem,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
