import 'package:flutter/material.dart';
import 'package:test/found_inform_cards.dart';

class ListViewOfFound extends StatelessWidget {
  const ListViewOfFound({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 30),
        FoundInformCards(
          lostSince: "@lostSince",
          location1: "location1 of Found Item 1",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          lostSince: "@lostSince",
          location1: "location1 of Found Item 2",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          lostSince: "@Username3",
          location1: "location1 of Found Item 3",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          lostSince: "@Username4",
          location1: "location1 of Found Item 4",
          ),
      ],
    );
  }
}
