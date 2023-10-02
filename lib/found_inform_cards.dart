// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'on_click_cards.dart';

class FoundInformCards extends StatelessWidget {
  final String username;
  final String title;
  final String imageUrl;

  const FoundInformCards({
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OnClickCards(
                  username: username, title: title, imageUrl: imageUrl);
            }));
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
