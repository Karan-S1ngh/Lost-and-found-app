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
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
              
        ),
        LostInformCards(
          username: "@Username2",
          title: "Title of Lost Item 2",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        LostInformCards(
          username: "@Username3",
          title: "Title of Lost Item 3",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        LostInformCards(
          username: "@Username4",
          title: "Title of Lost Item 4",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
      ],
    );
  }
}
