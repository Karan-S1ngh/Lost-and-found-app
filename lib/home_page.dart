import 'package:flutter/material.dart';
import 'package:test/list_view_of_found.dart';
import 'package:test/list_view_of_lost.dart';
import 'package:test/animated_bottom_bar.dart';
// import 'on_click_tab.dart';
import 'about_us_page.dart';
import 'privacy_policy_page.dart';
import 'help_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'first_page.dart';
import 'profile_page.dart';
import 'lost_item_add.dart';
import 'found_item_add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                backgroundColor: const Color.fromARGB(255, 109, 57, 199),
                foregroundColor: Colors.white,
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
                actions: [
                  IconButton(
                    icon: const Icon(Icons.account_circle), // Profile icon
                    onPressed: () {
                      // Handle profile button tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                  ),
                ],
              )
            : null, // Hides app bar for About Us, Privacy Policy, and Help pages
        body: body,
        floatingActionButton: selectedBarIndex == 0 ||
                selectedBarIndex ==
                    1 //to remove Add item button from About, Help & Privacy
            ? FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 109, 57, 199),
                foregroundColor: Colors.white,
                icon: const Icon(Icons.add),
                label: const Text('Add Item'),
                onPressed: () {
                  if (selectedBarIndex == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LostItemAdd(),
                      ),
                    );
                  } else if (selectedBarIndex == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoundItemAdd(),
                      ),
                    );
                  }
                },
              )
            : null,
        // ),

        bottomNavigationBar: AnimatedBottomBar(
          barItems: [
            BarItem(
              text: "Lost",
              iconData: Icons.search_off,
              color: const Color.fromARGB(255, 136, 136, 136),
            ),
            BarItem(
              text: "Found",
              iconData: Icons.search,
              color: const Color.fromARGB(255, 136, 136, 136),
            ),
            BarItem(
              text: "About Us",
              iconData: Icons.info,
              color: const Color.fromARGB(255, 136, 136, 136),
            ),
            BarItem(
              text: "Privacy",
              iconData: Icons.lock,
              color: const Color.fromARGB(255, 136, 136, 136),
            ),
            BarItem(
              text: "Help",
              iconData: Icons.help,
              color: const Color.fromARGB(255, 136, 136, 136),
            ),
          ],
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(fontSize: 15.0, iconSize: 32.0),
          onBarTap: (index) {
            setState(
              () {
                selectedBarIndex = index;
              },
            );
          },
          selectedBarIndex: selectedBarIndex,
        ),
      ),
    );
  }
}
