import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UserModel.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Titre de l'AppBar si nécessaire
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign in', // Texte "Sign in"
              style: TextStyle(
                fontSize: 29.0, // Taille de police
                fontWeight: FontWeight.bold, // Gras
              ),
            ),
            SizedBox(height: 20), // Espace entre le texte et l'image
            Image.asset(
              'assets/logo-haroon-app.png', // Chemin relatif à votre image locale
              width: 160, // Largeur de l'image
              height: 160, // Hauteur de l'image
              fit: BoxFit.contain, // Mode de redimensionnement de l'image
            ),
            Consumer<UserModel>(
              builder: (context, userModel, _) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () async {
                        String enteredEmail = _emailController.text.trim();
                        String enteredPassword = _passwordController.text.trim();

                        bool success = await userModel.login(enteredEmail, enteredPassword);

                        if (success) {
                          Navigator.pushReplacementNamed(context, '/profile');
                        } else {
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEA0000), // Couleur de fond rouge
                        foregroundColor: Colors.white, // Couleur du texte blanche
                      ),
                      child: Text('Login'),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'or sign in with', // Texte "or sign in with"
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0, // Taille de police
                        fontWeight: FontWeight.normal, // Style de police
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Logique de connexion avec Google
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.white, // Couleur de fond blanche
                          ),
                          child: Image.asset(
                            'assets/google.png',
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 20.0), // Espace entre les boutons
                        ElevatedButton(
                          onPressed: () {
                            // Logique de connexion avec Facebook
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Color(0xFF1877F2), // Couleur de fond de Facebook
                          ),
                          child: Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 20.0), // Espace entre les boutons
                        ElevatedButton(
                          onPressed: () {
                            // Logique de connexion avec Apple
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.black, // Couleur de fond noire
                          ),
                          child: Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0), // Espace entre les boutons de connexion et le texte de création de compte
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            // Logique de navigation vers la page d'inscription
                            Navigator.pushNamed(context, '/Inscription');
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Color(0xFFEA0000), // Couleur du texte en rouge
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
