import 'package:flutter/material.dart';
import 'claim_page.dart';
import 'found_page.dart';

class OnClickLostCards extends StatelessWidget {
  final String category;
  final String brand;
  final String color;
  final String lostSince;
  final String location1;
  final String location2;
  final String? imageUrl;

  const OnClickLostCards({
    Key? key,
    required this.category,
    required this.brand,
    required this.color,
    required this.lostSince,
    required this.location1,
    required this.location2,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return OnClickCards(
      brand: brand,
      category: category,
      color: color,
      lostSince: lostSince,
      location1: location1,
      location2: location2,
      imageUrl: imageUrl,
      showClaimButton: false,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FoundPage()),
        );
      },
    );
  }
}

class OnClickFoundCards extends StatelessWidget {
  final String brand;
  final String color;
  final String category;
  final String foundOn;
  final String location1;
  final String? imageUrl;

  const OnClickFoundCards({
    Key? key,
    required this.brand,
    required this.color,
    required this.category,
    required this.foundOn,
    required this.location1,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return OnClickCards(
      brand: brand,
      category: category,
      color: color,
      lostSince: foundOn, // Here, `foundOn` is used as `lostSince`
      location1: location1,
      location2:
          '', // Since found items don't have `location2`, it's left empty
      imageUrl: imageUrl,
      showClaimButton: true,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ClaimPage()),
        );
      },
    );
  }
}

class OnClickCards extends StatelessWidget {
  final String brand;
  final String category;
  final String color;
  final String lostSince;
  final String location1;
  final String location2;
  final String? imageUrl;
  final bool showClaimButton;
  final VoidCallback onPressed;

  const OnClickCards({
    Key? key,
    required this.brand,
    required this.category,
    required this.color,
    required this.lostSince,
    required this.location1,
    required this.location2,
    this.imageUrl,
    required this.showClaimButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = showClaimButton ? 'Claim' : 'Found ?';
    String locationText = showClaimButton ? 'Found at' : 'Might be lost at';
    String timeText = showClaimButton ? 'Found on' : 'Lost since';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 102, 140, 147),
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
                height: 20,
              ),
              Text(
                'Brand: $brand',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Category: $category',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Color: $color',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '$locationText:\n'
                '      Location 1: $location1\n'
                '      Location 2: $location2',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$timeText: $lostSince\n',
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
                      backgroundColor: const Color.fromARGB(255, 238, 172, 102),
                      foregroundColor: Colors.black,
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
