import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String email = 'test@example.com';
  String password = 'password123';
  String _nom = 'cherni'; // Exemple de nom d'utilisateur par défaut
  String get nom => _nom;

  String _bio = ''; // Exemple de bio par défaut
  String get bio => _bio;

  File? _userImage; // Image de profil de type File
  File? get userImage => _userImage;

  // Méthode pour choisir une image depuis la galerie
  Future<void> pickImage() async {
    // Implémentation de l'ImagePicker
    // Vous devrez probablement ajuster cette méthode selon vos besoins exacts
    // Assurez-vous d'importer les packages nécessaires comme image_picker et permission_handler
  }

  // Méthode pour éditer la bio
  Future<void> editBio(BuildContext context) async {
    // Implémentation pour éditer la bio via un dialogue
    // Vous devrez probablement ajuster cette méthode selon vos besoins exacts
  }

  // Méthode future pour obtenir la bio (simulée ici avec un délai)
  Future<String> getBio() async {
    await Future.delayed(Duration(seconds: 1)); // Simuler un chargement asynchrone
    return _bio; // Retourne la bio actuelle
  }

  // Méthode pour vérifier les identifiants de connexion
  bool checkCredentials(String enteredEmail, String enteredPassword) {
    return (enteredEmail == email && enteredPassword == password);
  }
}
