import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'admin_page.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 89, 25, 100),
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "lib/images/first page.png"), // Adjust the path accordingly
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'CAMPUS LOST AND FOUND APP\n',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: ' “Find What’s Yours Campus Is Wide”  ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.search_rounded,
              size: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 122,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 129, 128, 128),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('LOGIN'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 122,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 129, 128, 128),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('SIGNUP'),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 122,
              height: 42,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 129, 128, 128),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('ADMIN LOGIN'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
