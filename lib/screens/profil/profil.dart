import 'package:flutter/material.dart';
import './profile_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50, // Taille du cercle d'avatar pour l'exemple
                backgroundImage: AssetImage('../../../assets/images/profil/1.png'),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20), // Espacement après l'avatar
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 24, // Taille du texte du nom pour l'exemple
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Espacement après le nom
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'user@example.com',
                  style: TextStyle(
                    fontSize: 12, // Taille du texte de l'email pour l'exemple
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Espacement avant la liste
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ProfileListItem(
                    icon: Icons.comment, // Exemple d'icône
                    text: 'Editer mon profil',
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.password, // Exemple d'icône
                    text: 'Changer mot de passe',
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.comment, // Exemple d'icône
                    text: 'FAQ',
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.people, // Exemple d'icône
                    text: 'Invite a Friend',
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.exit_to_app, // Exemple d'icône
                    text: 'Sign Out',
                    hasNavigation: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Espacement en bas
          ],
        ),
      ),
    );
  }
}
