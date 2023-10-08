import 'package:flutter/material.dart';
import 'password_recovery_page.dart'; // Import your password recovery page file

class LoginInPage extends StatelessWidget {
  const LoginInPage({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'WELCOME BACK',
                style: TextStyle(
                  fontSize: 35 * fem,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                ),
              ),
              SizedBox(height: 50 * fem),
              _buildInputField('EMAIL', fem),
              SizedBox(height: 40 * fem),
              _buildInputField('PASSWORD', fem),
              SizedBox(height: 50 * fem),
              GestureDetector(
                onTap: () {
                  // Navigate to the password recovery page
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PasswordRecoveryPage();
                  }));
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 18 * fem,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFFFFFF),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 50 * fem),
              _buildLoginInButton(fem),
            ],
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

  Widget _buildLoginInButton(double fem) {
    return Container(
      width: 320 * fem,
      height: 60 * fem,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30 * fem),
      ),
      child: Center(
        child: Text(
          'LOG IN',
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
