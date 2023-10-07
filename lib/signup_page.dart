import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 414; // Assuming design width is 414

    const imageUrl = 'https://images.app.goo.gl/ep3WvVCxRr6zoyZu8';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 77 * fem),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFA8CCD7),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 97 * fem),
              Text(
                'NEW ACCOUNT',
                style: TextStyle(
                  fontSize: 28 * fem,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                ),
              ),
              SizedBox(height: 25 * fem),
              _buildInputField('EMAIL', fem),
              SizedBox(height: 25 * fem),
              _buildInputField('USERNAME', fem),
              SizedBox(height: 25 * fem),
              _buildInputField('PASSWORD', fem),
              SizedBox(height: 25 * fem),
              _buildSignUpButton(fem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double fem) {
    return SizedBox(
      width: 228 * fem,
      height: 35 * fem,
      child: TextField(
        style: TextStyle(
          fontSize: 20 * fem,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF000000),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 20 * fem,
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
      width: 228 * fem,
      height: 51 * fem,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(24 * fem),
      ),
      child: Center(
        child: Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20 * fem,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
