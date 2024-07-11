import 'package:flutter/material.dart';
import 'package:harounapp/login_inscription/inscription.dart';
import 'package:harounapp/login_inscription/login_page.dart';
import 'package:harounapp/UI/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haroun App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Profile(), // Exemple : Page de connexion comme page d'accueil
        '/inscription': (context) => Inscription(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
