import 'package:flutter/material.dart';
import 'claim_page.dart';
import 'found_page.dart';

class OnClickLostCards extends StatelessWidget {
  final String username;
  final String title;
  final String imageUrl;

  const OnClickLostCards({
    super.key,
    required this.username,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return OnClickCards(
      username: username,
      title: title,
      imageUrl: imageUrl,
      showClaimButton: false,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FoundPage()));
      },
    );
  }
}

class OnClickFoundCards extends StatelessWidget {
  final String username;
  final String title;
  final String imageUrl;

  const OnClickFoundCards({
    super.key,
    required this.username,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return OnClickCards(
      username: username,
      title: title,
      imageUrl: imageUrl,
      showClaimButton: true,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ClaimPage()));
      },
    );
  }
}

class OnClickCards extends StatelessWidget {
  final String username;
  final String title;
  final String? imageUrl;
  final bool showClaimButton;
  final VoidCallback onPressed;

  const OnClickCards({
    super.key,
    required this.username,
    required this.title,
    this.imageUrl,
    required this.showClaimButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = showClaimButton ? 'Claim' : 'Found?';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Item Info',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 700,
          width: 340,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 360,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 182, 4, 242),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'No Image Available',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Object: $title',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Username: @$username',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // Conditionally show claim or found button
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 182, 4, 242),
                    ),
                    child: Text(buttonText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
