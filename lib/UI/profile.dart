import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../UserModel.dart';
import 'footer.dart'; // Assurez-vous que le chemin est correct

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);

    // Fonction pour afficher le dialogue
    void showBonjourDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            content: Text('Bonjour '+userModel.nom),
          );
        },
      );
    }

    // Appel du dialogue au montage du widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBonjourDialog();
    });

    return Consumer<UserModel>(
      builder: (context, userModel, _) => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Section de la photo de profil
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/pexels-photo-771742.jpeg'), // Utilisez userModel.userImage ici
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              // Gérer l'importation de nouvelle photo
                              print('Changer photo de profil');
                              userModel.pickImage(); // Appel à une méthode de modèle pour choisir une image
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      userModel.nom,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0), // Ajout d'un espace entre le nom et le Row
                    // Row sous le nom de l'utilisateur
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '123', // Remplacez par le nombre de j'aimes réel
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('J\'aimes'),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: [
                            Text(
                              '456', // Remplacez par le nombre de followers réel
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Followers'),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: [
                            Text(
                              '789', // Remplacez par le nombre de suivis réel
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Suivis'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Autres sections à mettre à jour avec userModel
              SizedBox(height: 20.0),
              // Section des actions
              // Ajoutez ici d'autres widgets pour les actions spécifiques à l'utilisateur
              SizedBox(height: 10.0),
              // Section de la bio
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      userModel.editBio(context); // Utilisation d'une méthode pour éditer la bio dans le modèle
                    },
                    child: Text('Ajouter une bio'),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              // Affichage de la bio avec FutureBuilder
              FutureBuilder<String>(
                future: userModel.getBio(), // Appel à une méthode future du modèle pour obtenir la bio
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Affichage pendant le chargement
                  } else {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          snapshot.data!,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Aucune bio ajoutée pour le moment',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
              // Autres sections à mettre à jour avec FutureBuilder
              // Ajoutez ici d'autres widgets basés sur d'autres futures ou données de userModel
            ],
          ),
        ),
        bottomNavigationBar: AppFooter(
          onHomePressed: () {
            // Code pour Home
          },
          onDiscoverPressed: () {
            // Code pour Discover
          },
          onMediaImportPressed: () {
            // Code pour Media Import
          },
          onInboxPressed: () {
            // Code pour Inbox
          },
          onProfilePressed: () {
            // Code pour Profile
          },
        ),
      ),
    );
  }
}
