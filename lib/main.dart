import 'package:flutter/material.dart';
import 'package:harounapp/login_inscription/login_page.dart';
import 'package:harounapp/login_inscription/inscription.dart';
import 'package:harounapp/UI/profile.dart';
import 'package:provider/provider.dart';

import 'UserModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Haroun app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/', // Définissez la route initiale ici
        routes: {
          '/': (context) => Login(), // Route pour l'écran de connexion
          '/profile': (context) => Profile(), // Route pour l'écran de profil
          // Ajoutez d'autres routes au besoin
        },
      ),
    ),
  );
}
