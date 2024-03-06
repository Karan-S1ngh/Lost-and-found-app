import 'package:flutter/material.dart';
import 'package:test/lost_inform_cards.dart';

class ListViewOfLost extends StatelessWidget {
  const ListViewOfLost({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 30),
        LostInformCards(
          username: "@Username1",
          title: "Title of Lost Item 1",
          imageUrl:
              "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
        ),
        LostInformCards(
          username: "@Username2",
          title: "Title of Lost Item 2",
          imageUrl:
              "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
        ),
        LostInformCards(
          username: "@Username3",
          title: "Title of Lost Item 3",
          imageUrl:
              "https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg",
        ),
        LostInformCards(
          username: "@Username4",
          title: "Title of Lost Item 4",
          ),
      ],
    );
  }
}
