import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Haroun app',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Contrôleurs pour les champs de saisie
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Fonction pour gérer la connexion
  void _handleLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Exemple de logique de connexion (simulée)
    print('Email: $email');
    print('Password: $password');
  }

  // Fonction pour gérer l'inscription
  void _handleSignUp() {
    Navigator.pushNamed(context, '/inscription');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          // Bouton S'inscrire
          TextButton(
            onPressed: _handleSignUp,
            child: Text(
              'Je n\'ai pas de compte. S\'inscrire',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 24.0),
          // Bouton de connexion
          ElevatedButton(
            onPressed: _handleLogin,
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
    );
  }
}
