import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:harounapp/UI/footer.dart'; // Assurez-vous de corriger le chemin vers votre fichier footer.dart

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'username',
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (String result) {
              print(result); // Afficher simplement l'option sélectionnée // console
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Payer une formation',
                child: Text('Payer une formation'),
              ),
              const PopupMenuItem<String>(
                value: 'Paramètres et confidentialité',
                child: Text('Paramètres et confidentialité'),
              ),
            ],
          ),
        ],

      ),
      body: ProfilePage(),
      bottomNavigationBar: AppFooter(
        onHomePressed: () {
          // Action pour aller à l'accueil
          print('Go to Home');
        },
        onDiscoverPressed: () {
          // Action pour découvrir
          print('Discover');
        },
        onMediaImportPressed: () {
          // Action pour importer un média
          print('Import Media');
        },
        onInboxPressed: () {
          // Action pour la boîte de réception
          print('Inbox');
        },
        onProfilePressed: () {
          // Action pour aller au profil
          print('Go to Profile');
        },
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _bio = ''; // Variable pour stocker la bio
  late ImagePicker _picker; // Déclaration de l'instance ImagePicker

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker(); // Initialisation de l'instance ImagePicker
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      backgroundImage: AssetImage('assets/pexels-photo-771742.jpeg'), // image par défaut
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          // Gérer l'importation de nouvelle photo
                          print('Changer photo de profil');
                          _pickImage(); // Appeler la méthode pour choisir une image
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'username',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Section des statistiques
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Suivis'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('J\'aime'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          // Section des actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Gérer la modification du profil
                    print('Modifier le profil');
                  },
                  child: Text('Modifier le profil'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Gérer l'accès à la formation
                    print('Formation');
                  },
                  child: Text('Formation'),
                ),
                IconButton(
                  icon: Icon(Icons.person_add),
                  onPressed: () {
                    // Gérer l'ajout d'amis
                    print('Ajouter des amis');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          // Section de la bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  _editBio(context); // Fonction pour éditer la bio
                },
                child: Text('Ajouter une bio'),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          // Affichage de la bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _bio.isNotEmpty ? _bio : 'Aucune bio ajoutée pour le moment',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          // Conteneur pour l'importation de contenu multimédia
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Importer un contenu multimédia'),
                IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: () {
                    // Gérer l'importation d'une image depuis la galerie
                    _pickImage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour choisir une image depuis la galerie
  void _pickImage() async {
    if (await Permission.photos.request().isGranted ||
        await Permission.mediaLibrary.request().isGranted) {
      // Permission granted, open gallery
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        // Handle image selection here
        print('Image selected: ${pickedFile.path}');
        setState(() {
          // Update UI with selected image
        });
      }
    } else {
      // Permission denied
      print('Permission non accordée pour accéder aux photos');
    }
  }

  // Fonction pour éditer la bio
  void _editBio(BuildContext context) async {
    String bio = _bio; // Initialisez avec la bio existante

    // Affichez un dialogue pour éditer la bio
    String newBio = await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _bioController = TextEditingController(text: bio);

        return AlertDialog(
          title: Text('Éditer la bio'),
          content: TextField(
            controller: _bioController,
            maxLines: 3, // Nombre de lignes pour le champ de texte
            decoration: InputDecoration(
              hintText: 'Entrez votre bio ici',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(_bioController.text);
              },
              child: Text('Enregistrer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue sans sauvegarder
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );

    if (newBio != null) {
      setState(() {
        _bio = newBio; // Mettre à jour la bio dans l'état local du widget
      });
      print('Nouvelle bio: $_bio');
    }
  }
}
