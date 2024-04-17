import 'package:flutter/material.dart';
import 'package:test/on_click_cards.dart';

class FoundInformCards extends StatelessWidget {
  final String lostSince;
  final String location1;
  final String? imageUrl; // Made imageUrl nullable for optional input

  const FoundInformCards({
    super.key,
    required this.lostSince,
    required this.location1,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OnClickFoundCards(
                  lostSince: lostSince,
                  location1: location1,
                  imageUrl: imageUrl ?? "", brand: '', color: '', category: '',
                  location2: '', // Use empty string if imageUrl is null
                ),
              ),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 182, 4, 242),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x4D000000),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 20.0,
                      spreadRadius: 1,
                    ),
                  ],
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
              Positioned(
                top: 140,
                left: 20,
                child: Container(
                  width: 200,
                  height: 25,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lostSince,
                      style: const TextStyle(
                        fontFamily: 'Raleway-Light',
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                left: 20,
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Text(
                          location1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
