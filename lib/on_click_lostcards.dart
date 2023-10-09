import 'package:flutter/material.dart';

class OnClickLostCards extends StatelessWidget {
  final String username;
  final String title;
  final String imageUrl;

  const OnClickLostCards({
    Key? key,
    required this.username,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(imageUrl),
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
              // Claim button at the bottom right corner
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle claim logic here
                    },
                    child: const Text('Claim'),
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
