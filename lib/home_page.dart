import 'package:flutter/material.dart';
import 'package:test/list_view_of_found.dart';
import 'package:test/list_view_of_lost.dart';
import 'package:test/animated_bottom_bar.dart';
import 'on_click_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00b9f5),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            selectedBarIndex == 0 ? 'Lost Items' : 'Found Items',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00b9f5),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const OnClickFAB();
          }));
        },
      ),
      body: selectedBarIndex == 0
          ? const ListViewOfLost()
          : const ListViewOfFound(),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: [
          BarItem(
            text: "Lost",
            iconData: Icons.blur_off,
            color: const Color.fromARGB(0, 137, 9, 137),
          ),
          BarItem(
            text: "Found",
            iconData: Icons.blur_on,
            color: const Color(0xFF012b72),
          ),
        ],
        animationDuration: const Duration(milliseconds: 150),
        barStyle: BarStyle(fontSize: 23.0, iconSize: 30.0),
        onBarTap: (index) {
          setState(() {
            selectedBarIndex = index;
          });
        },
      ),
    );
  }
}
