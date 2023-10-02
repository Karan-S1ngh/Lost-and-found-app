import 'package:flutter/material.dart';
import 'package:test/on_click_cards.dart';

class LostInformCards extends StatelessWidget {
  final String username;
  final String title;
  final String imageUrl;

  const LostInformCards({
    Key? key,
    required this.username,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OnClickCards(
                      username: username, title: title, imageUrl: imageUrl)),
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
                  color: const Color(0xFF00b9f5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x4D000000),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 20.0,
                      spreadRadius: 1,
                    ),
                  ],
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
                      username,
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
                          title,
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
              Positioned(
                left: -5.0,
                child: Container(
                  height: 140.0,
                  width: 310.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x4D000000),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 20.0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Image.network(imageUrl),
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
