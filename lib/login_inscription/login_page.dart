import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UI/profile.dart';
import '../UserModel.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Consumer<UserModel>(
          builder: (context, userModel, _) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Champ de saisie pour l'email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0),
                // Champ de saisie pour le mot de passe
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0),
                // Bouton de connexion
                ElevatedButton(
                  onPressed: () {
                    String enteredEmail = _emailController.text.trim();
                    String enteredPassword = _passwordController.text.trim();

                    if (userModel.checkCredentials(enteredEmail, enteredPassword)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()), // Navigation vers la page Profile après connexion réussie
                      );
                    } else {
                      // Afficher une erreur de connexion
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erreur de connexion'),
                            content: Text('Email ou mot de passe incorrect'),
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
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 12.0),
                // Phrase d'invitation pour se connecter avec Facebook
                Text(
                  'Ou connectez-vous avec Facebook',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 12.0),
                // Bouton de connexion avec Facebook
                ElevatedButton.icon(
                  onPressed: () {
                    // Gérer l'authentification avec Facebook ici
                    print('Authentification avec Facebook');
                  },
                  icon: Icon(Icons.facebook),
                  label: Text('Continuer avec Facebook'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Gérer l'authentification avec Google ici
                    print('Authentification avec Google');
                  },
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Continuer avec Google'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
