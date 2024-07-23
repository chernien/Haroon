import 'package:flutter/material.dart';
import 'package:harounapp/Inscription.dart';
import 'package:harounapp/login_inscription/login_page.dart';
import 'package:harounapp/login_inscription/inscription.dart';
import 'package:harounapp/UI/profile.dart';
import 'package:provider/provider.dart';

import 'UserModel.dart';
import 'login_inscription/MultiStepSignUp.dart';
import 'login_inscription/signup.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Haroun app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/', // Define the initial route here
        routes: {
          '/': (context) => Inscri(), // Route for the signup screen
          '/login': (context) => Login(),
          '/profile': (context) => Profile(), // Route for the profile screen
          '/Inscription': (context) => Inscription(),
          '/multi-step-signup': (context) => MultiStepSignUp(), // Add the multi-step sign-up route
          // Add other routes as needed
        },
      ),
    ),
  );
}
