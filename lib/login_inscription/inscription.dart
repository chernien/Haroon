import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Services/UserService.dart';

// Enum pour le genre
enum Genre { Homme, Femme }

class Inscription extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<Inscription> {
  final UserService _userService = UserService();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _dateNaissanceController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Genre _genre = Genre.Homme;
  String? _nationalite;
  List<String> nationalites = [
    'Tunisian 🇹🇳',
    'American 🇺🇸',
    'British 🇬🇧',
    'French 🇫🇷',
    'German 🇩🇪',
    'Italian 🇮🇹',
    'Japanese 🇯🇵',
  ];

  void _handleInscription() async {
    String nom = _nomController.text.trim();
    String prenom = _prenomController.text.trim();
    String dateNaissance = _dateNaissanceController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String genre = _genre == Genre.Homme ? 'Male' : 'Female'; // Utiliser les valeurs exactes du backend

    try {
      // Formater la date au format ISO8601 directement
      DateTime parsedDate = DateTime.parse(dateNaissance);
      String formattedDate = parsedDate.toIso8601String();

      await _userService.register(
        firstname: prenom,
        lastname: nom,
        email: email,
        password: password,
        birthDate: formattedDate, // Utiliser la date formatée en ISO8601
        nationality: _nationalite ?? '', // Utiliser la nationalité sélectionnée
        gender: genre,

      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Inscription réussie'),
            content: Text('Vous êtes inscrit avec succès!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur d\'inscription'),
            content: Text('Une erreur s\'est produite lors de l\'inscription: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      print('Erreur d\'inscription: $e'); // Afficher l'erreur dans la console
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _prenomController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _dateNaissanceController,
                decoration: InputDecoration(
                  labelText: 'Date de Naissance',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null)
                    _dateNaissanceController.text =
                        picked.toIso8601String(); // Utiliser directement ISO8601 pour l'affichage
                },
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: _nationalite,
                onChanged: (value) {
                  setState(() {
                    _nationalite = value;
                  });
                },
                items: nationalites.map((String nationalite) {
                  return DropdownMenuItem<String>(
                    value: nationalite,
                    child: Row(
                      children: <Widget>[
                        Text(nationalite),
                        SizedBox(width: 8),
                      ],
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Nationalité',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              ListTile(
                title: Text('Homme'),
                leading: Radio(
                  value: Genre.Homme,
                  groupValue: _genre,
                  onChanged: (Genre? value) {
                    setState(() {
                      _genre = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Femme'),
                leading: Radio(
                  value: Genre.Femme,
                  groupValue: _genre,
                  onChanged: (Genre? value) {
                    setState(() {
                      _genre = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _handleInscription,
                child: Text('S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

