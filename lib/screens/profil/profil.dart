import 'package:flutter/material.dart';
import './profile_list_item.dart';
import '../setting/editProfile.dart';
import '../setting/faqPage.dart';
import '../setting/addFerme.dart';
import '../setting/privacy.dart';
import '../deconnexion/deconnexion.dart';
import '../drawer/drawer_screen.dart';
import '../setting/changePassword.dart';
import '../notifications/notifcation_tap.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold), // Titre en gras
        ),
        centerTitle: true, // Centrer le titre de l'appbar
       
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications), // Icône de notification par défaut
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotitcationTap()),
                  );
                },
              ),
               Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '2', // Remplacez par le nombre de notifications non lues
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.person), // Icône utilisateur
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigue vers la page de profil
                );
              },
            ),
          ),
        ],
      ),
      
      drawer: MyDrawer(
        selectedIndex: 0, // Mettez à jour selectedIndex selon l'état de votre application
        onItemTapped: (index) {
          // Gérer la navigation ici
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/subjectFile');
              break;
            case 2:
              Navigator.pushNamed(context, '/breedingJournal');
              break;
            case 3:
              Navigator.pushNamed(context, '/purchaseJournal');
              break;
            case 4:
              Navigator.pushNamed(context, '/salesJournal');
              break;
            case 6:
              Navigator.pushNamed(context, '/simpleDashboard');
              break;
            case 7:
              Navigator.pushNamed(context, '/notification');
              break;
            case 8:
              Navigator.pushNamed(context, '/sellSubjects');
              break;
            case 9:
              Navigator.pushNamed(context, '/buySubjects');
              break;
            case 10:
              Navigator.pushNamed(context, '/rating');
              break;
          }
        },
        onLogoutTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeconnexionPage()),
          );
        },
      ),
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 55), 
            Center(
              child: CircleAvatar(
                radius: 20, // Taille du cercle d'avatar pour l'exemple
                backgroundImage: AssetImage('../../../assets/images/profil/4.png'),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 15), // Espacement après l'avatar
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
            SizedBox(height: 10), // Espacement avant la liste
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ProfileListItem(
                    icon: Icons.person, // Exemple d'icône
                    text: 'Editer mon profil',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.password, // Exemple d'icône
                    text: 'Changer mot de passe',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                      );
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.security, // Exemple d'icône
                    text: "Conditions d'utilisation",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyPage()),
                      );
                    },
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.comment, // Exemple d'icône
                    text: 'FAQ',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FaqPage()),
                      );
                    },
                  ),
                  SizedBox(height: 12), // Espacement entre les items
                  ProfileListItem(
                    icon: Icons.add, // Exemple d'icône
                    text: 'Ajouter une ferme',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddFerme()),
                      );
                    },
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
