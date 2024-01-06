import 'package:flutter/material.dart';
import 'package:sharedpreference/Register.dart';
import 'package:sharedpreference/Login.dart';
import 'package:sharedpreference/Details.dart';
import 'package:sharedpreference/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Data Example',
      initialRoute: '/register',
      routes: {
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/details': (context) => const Details(),
        '/home': (context) => const Home(),
      },
    );
  }
}
