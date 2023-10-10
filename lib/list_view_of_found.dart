import 'package:flutter/material.dart';
import 'package:test/found_inform_cards.dart';

class ListViewOfFound extends StatelessWidget {
  const ListViewOfFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        SizedBox(height: 30),
        FoundInformCards(
          username: "@Username1",
          title: "Title of Found Item 1",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          username: "@Username2",
          title: "Title of Found Item 2",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          username: "@Username3",
          title: "Title of Found Item 3",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
        ),
        FoundInformCards(
          username: "@Username4",
          title: "Title of Found Item 4",
          ),
      ],
    );
  }
}
