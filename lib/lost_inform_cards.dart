import 'package:flutter/material.dart';
import 'package:test/on_click_cards.dart';

class LostInformCards extends StatelessWidget {
  final String lostSince;
  final String location1;
  final String location2;
  final String? imageUrl; // Made imageUrl nullable for optional input
  final String brand; // Add brand
  final String category; // Add category
  final String colour; // Add color

  const LostInformCards({
    Key? key,
    required this.lostSince,
    required this.location1,
    required this.location2,
    this.imageUrl,
    required this.brand,
    required this.category,
    required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OnClickLostCards(
                    lostSince: lostSince,
                    location1: location1,
                    brand: brand,
                    category: category,
                    color: colour,
                    location2: location2,
                    imageUrl: null // Use empty string if imageUrl is null
                    ),
              ),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                width: 300,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 102, 140, 147),
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
                top: 135,
                left: 20,
                child: Container(
                  width: 200,
                  height: 93,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Lost Since: $lostSince',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Brand: $brand',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Category: $category',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Color: $colour',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
      ],
    );
  }
}
//42:30
