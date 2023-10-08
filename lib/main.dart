import 'package:flutter/material.dart';
import 'package:test/first_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lost and Found App',
      home: FirstPage(),
    );
  }
<<<<<<< HEAD
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
//heeeeelooooo
=======
}
>>>>>>> e17755d1b8bff58c544f63e328097807ad4a87c3
