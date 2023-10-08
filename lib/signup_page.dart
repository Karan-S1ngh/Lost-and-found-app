import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
    const SignUpPage({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / 414; // Assuming design width is 414

    const imageUrl =
        'https://s3.amazonaws.com/cdn.freshdesk.com/data/helpdesk/attachments/production/72022318511/original/EeVpBS7LD8M10kPxO4qhetyjimdrqwbVeg.png?1664541628';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color:  Color(0xFFFFFFFF),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, screenHeight * 0.2, 0, screenHeight * 0.1),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color:  Color(0xFFA8CCD7),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NEW ACCOUNT',
                style: TextStyle(
                  fontSize: 32 * fem,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                ),
              ),
              SizedBox(height: 20 * fem),
              _buildInputField('EMAIL', fem),
              SizedBox(height: 15 * fem),
              _buildInputField('USERNAME', fem),
              SizedBox(height: 15 * fem),
              _buildInputField('PASSWORD', fem),
              SizedBox(height: 20 * fem),
              _buildSignUpButton(fem),
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
