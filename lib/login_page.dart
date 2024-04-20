import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/components/square_tile.dart';
import 'package:test/home_page.dart';
import 'package:logger/logger.dart';
import 'password_recovery_page.dart';
import 'signup_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginInPage extends StatefulWidget {
  LoginInPage({Key? key}) : super(key: key);

  @override
  _LoginInPageState createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isObscured = true;

  Future<void> _handleLogin(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(context, "Please fill in all fields");
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        // User logged in successfully, navigate to home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'wrong-password') {
          _showSnackBar(context, 'Wrong password provided for that user.');
        } else {
          _showSnackBar(
              context, 'No such account: Please recheck email and password');
        }
      } else {
        _showSnackBar(context, 'Error during login: $e');
      }
    }
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          // User logged in successfully, navigate to home page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      } else {
        _showSnackBar(context, 'Google sign-in cancelled');
      }
    } catch (error) {
      logger.e('Error signing in with Google: $error');
      _showSnackBar(context, 'Failed to sign in with Google');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 414; // Assuming design width is 414

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 109, 57, 199),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(24 * fem, 68 * fem, 24 * fem, 22 * fem),
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
                    margin: EdgeInsets.only(bottom: 26 * fem),
                    width: 29 * fem,
                    height: 21 * fem,
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                ),
                SizedBox(height: 4 * fem),
                Container(
                  margin: EdgeInsets.only(bottom: 8 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 11 * fem),
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
                        margin: EdgeInsets.only(top: 0.99 * fem),
                        width: 26.96 * fem,
                        height: 26.96 * fem,
                        child: const Icon(
                          Icons.waving_hand,
                          color: Color.fromARGB(255, 255, 193, 24),
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10 * fem),
                  child: Text(
                    'Sign In to your account',
                    style: GoogleFonts.inter(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                _buildInputField('EMAIL', fem),
                SizedBox(height: 30 * fem),
                _buildInputField('PASSWORD', fem, isPassword: true),
                SizedBox(height: 28 * fem),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                          fontSize: 19 * fem,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26 * fem),
                _buildLoginInButton(fem, context),
                SizedBox(height: 20 * fem),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 109, 57, 199),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 29 * fem),
                Padding(
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
                          " Or login with ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 112, 111, 111),
                            fontSize: 17,
                          ),
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
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _handleGoogleSignIn(context);
                      },
                      child: SquareTile(imagePath: 'lib/images/google.png'),
                    ),
                  ],
                ),
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
        obscureText: isPassword ? _isObscured : false,
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
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildLoginInButton(double fem, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60 * fem,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 109, 57, 199),
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
