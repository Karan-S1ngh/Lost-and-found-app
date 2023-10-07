import 'package:flutter/material.dart';
import 'package:test/lost_inform_cards.dart';

class ListViewOfLost extends StatelessWidget {
  const ListViewOfLost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 30),
        LostInformCards(
          username: "@Username1",
          title: "Title of Lost Item 1",
          imageUrl: "https://example.com/lost_image1.jpg",
        ),
        LostInformCards(
          username: "@Username2",
          title: "Title of Lost Item 2",
          imageUrl: "https://example.com/lost_image2.jpg",
        ),
        LostInformCards(
          username: "@Username3",
          title: "Title of Lost Item 3",
          imageUrl: "https://example.com/lost_image3.jpg",
        ),
        LostInformCards(
          username: "@Username4",
          title: "Title of Lost Item 4",
          imageUrl: "https://example.com/lost_image4.jpg",
        ),
      ],
    );
  }
}

