import 'package:flutter/material.dart';
import 'login_page.dart'; // Import your login page file here
import 'signup_page.dart'; // Import your signup page file here


class FirstPage extends StatelessWidget {
    const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 414;
    double ffem = 1;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20 * fem, 35 * fem, 22 * fem, 87 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff301934),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 595 * fem),
              constraints: BoxConstraints(maxWidth: 285 * fem),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2125 * ffem / fem,
                    color:const  Color(0xffffffff),
                  ),
                  children: [
                    const TextSpan(
                      text: 'CAMPUS LOST AND FOUND APP\n',
                    ),
                    TextSpan(
                      text: '      Find What’s Yours Campus Yours',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color:const  Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 42 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 74 * fem, 0 * fem),
                      width: 122 * fem,
                      height: 42 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16 * fem),
                        color:const Color(0xffd9d9d9),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: Container(
                      width: 122 * fem,
                      height: 42 * fem,
                      decoration: BoxDecoration(
                        color:const  Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(16 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
