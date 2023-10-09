import 'package:flutter/material.dart';
import 'package:test/list_view_of_found.dart';
import 'package:test/list_view_of_lost.dart';
import 'package:test/animated_bottom_bar.dart';
import 'on_click_tab.dart';
import 'about_us_page.dart';
import 'privacy_policy_page.dart';
import 'help_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    String title = '';
    if (selectedBarIndex == 0) {
      title = 'Lost Items';
    } else if (selectedBarIndex == 1) {
      title = 'Found Items';
    }

    Widget body;
    if (selectedBarIndex == 0) {
      body = const ListViewOfLost();
    } else if (selectedBarIndex == 1) {
      body = const ListViewOfFound();
    } else if (selectedBarIndex == 2) {
      body = const AboutUsPage();
    } else if (selectedBarIndex == 3) {
      body = const PrivacyPolicyPage();
    } else if (selectedBarIndex == 4) {
      body = const HelpPage();
    } else {
      body = const Center(child: Text('Invalid Tab Index'));
    }

    return SafeArea(
      child: Scaffold(
        appBar: selectedBarIndex <= 1
            ? AppBar(
                backgroundColor: const Color.fromARGB(255, 182, 4, 242),
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            : null, // Hides app bar for About Us, Privacy Policy, and Help pages
        body: body,
        floatingActionButton: SafeArea(
          child: FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 182, 4, 242),
            foregroundColor: Colors.white,
            icon: const Icon(Icons.add),
            label: const Text('Add Item'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OnClickTAB();
                  },
                ),
              );
            },
          ),
        ),

        bottomNavigationBar: AnimatedBottomBar(
          barItems: [
            BarItem(
              text: "Lost",
              iconData: Icons.search_off,
              color: const Color.fromARGB(255, 182, 4, 242),
            ),
            BarItem(
              text: "Found",
              iconData: Icons.search,
              color: const Color.fromARGB(255, 182, 4, 242),
            ),
            BarItem(
              text: "About Us",
              iconData: Icons.info,
              color: const Color.fromARGB(255, 182, 4, 242),
            ),
            BarItem(
              text: "Privacy Policy",
              iconData: Icons.lock,
              color: const Color.fromARGB(255, 182, 4, 242),
            ),
            BarItem(
              text: "Help",
              iconData: Icons.help,
              color: const Color.fromARGB(255, 182, 4, 242),
            ),
          ],
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: 13.0, iconSize: 30.0),
          onBarTap: (index) {
            setState(
              () {
                selectedBarIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
