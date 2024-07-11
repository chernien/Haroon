import 'package:flutter/material.dart';

// Enum pour le genre
enum Genre { Homme, Femme }

class Inscription extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<Inscription> {
  // Contrôleurs pour les champs de saisie
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _dateNaissanceController = TextEditingController();
  Genre _genre = Genre.Homme; // Genre par défaut
  String? _nationalite; // Nationalité sélectionnée

  // Liste des nationalités avec drapeaux (à remplir selon vos besoins)
  List<String> nationalites = [
    'Tunisie 🇹🇳',
    'France 🇫🇷',
    'États-Unis 🇺🇸',
    'Algérie 🇩🇿',
    'Maroc 🇲🇦',
    // Ajoutez d'autres nationalités avec drapeaux au besoin
  ];

  // Fonction pour gérer l'inscription
  void _handleInscription() {
    String nom = _nomController.text.trim();
    String prenom = _prenomController.text.trim();
    String dateNaissance = _dateNaissanceController.text.trim();
    String genre = _genre == Genre.Homme ? 'Homme' : 'Femme';

    // Ici, vous pouvez ajouter la logique d'inscription
    // Par exemple, enregistrer les informations dans une base de données

    // Pour cet exemple, affichons les informations dans la console
    print('Nom: $nom');
    print('Prénom: $prenom');
    print('Date de Naissance: $dateNaissance');
    print('Genre: $genre');
    print('Nationalité: $_nationalite');
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
              // Champ de saisie pour le nom
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              // Champ de saisie pour le prénom
              TextField(
                controller: _prenomController,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              // Champ de saisie pour la date de naissance
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
                        picked.day.toString() +
                            '-' +
                            picked.month.toString() +
                            '-' +
                            picked.year.toString();
                },
              ),
              SizedBox(height: 12.0),
              // Dropdown pour sélectionner la nationalité
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
                        // Ajoutez un widget d'image pour le drapeau si nécessaire
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
              // Radio buttons pour sélectionner le genre
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
              // Bouton d'inscription
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
