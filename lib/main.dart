//import 'dart:developer';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/firebase_options.dart';
import 'package:test/first_page.dart';
import 'package:test/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  /*DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection("users")
      .doc("amrutapawar004@gmail.com")
      .get();
  log(snapshot.data());*/

//to add a new documentation
  /* Map<String, dynamic> newUserData = {
    "name": "Drishya",
    "email": "drishya258@gmail.com",
  };
  await firestore.collection("users").doc("drishya45@gmail.com").set(newUserData);
  log("New user saved!");*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost and Found App',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator while checking auth state
          } else {
            if (snapshot.hasData) {
              // User is authenticated, navigate to home page
              return const HomePage();
            } else {
              // User is not authenticated, show login/signup page
              return const FirstPage();
            }
          }
        },
      ),
    );
  }
}
