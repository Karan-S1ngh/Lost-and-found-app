import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.height / 812; // Adjust based on your design requirements
    double ffem = 1; // Assuming it's 1, adjust as needed for font scaling
        const imageUrl = 'https://images.app.goo.gl/ep3WvVCxRr6zoyZu8';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 812 * fem,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 113 * fem,
              top: 55 * fem,
              child: Align(
                child: SizedBox(
                  width: 106 * fem,
                  height: 30 * fem,
                  child: Text(
                    'UW Map',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 270 * fem,
              top: 48 * fem,
              child: Align(
                child: SizedBox(
                  width: 1 * fem,
                  height: 43 * fem,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 284 * fem,
              top: 52 * fem,
              child: Align(
                child: SizedBox(
                  width: 33.21 * fem,
                  height: 32.22 * fem,
                  child: Image.network(
                    imageUrl,
                    width: 33.21 * fem,
                    height: 32.22 * fem,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 812 * fem,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f000000),
                    offset: Offset(0, 4 * fem),
                    blurRadius: 2 * fem,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 88 * fem),
                    width: 375 * fem,
                    height: 812 * fem,
                    decoration: const BoxDecoration(
                      color: Color(0xffa8ccd7),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 152 * fem),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 28 * ffem,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'WELCOME',
                                  style: TextStyle(
                                    fontSize: 28 * ffem,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xe54b2e83),
                                  ),
                                ),
                                TextSpan(
                                  text: ' BACK',
                                  style: TextStyle(
                                    fontSize: 28 * ffem,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(21.5 * fem, 0, 16.5 * fem, 0),
                          width: double.infinity,
                          height: 1 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(97 * fem, 0, 96 * fem, 0),
                    width: double.infinity,
                    height: 51 * fem,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(24 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 42 * fem,
                    top: 248 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 292 * fem,
                        height: 336 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(51 * fem),
                            color: const Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 79 * fem,
                    top: 353 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 205 * fem,
                        height: 1 * fem,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 79 * fem,
                    top: 479 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 205 * fem,
                        height: 1 * fem,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 79 * fem,
                    top: 302 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 67 * fem,
                        height: 25 * fem,
                        child: Text(
                          'EMAIL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 84 * fem,
                    top: 425 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 126 * fem,
                        height: 25 * fem,
                        child: Text(
                          'PASSWORD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 146.5 * fem,
                    top: 502 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 172 * fem,
                        height: 19 * fem,
                        child: Text(
                          'forgot this password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff6ba8c2),
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

