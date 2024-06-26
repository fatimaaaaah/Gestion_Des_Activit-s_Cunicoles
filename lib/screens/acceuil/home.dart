import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/drawer_screen.dart';
import '../notifications/notificationPage.dart';
import '../profil/profil.dart'; 
import '../deconnexion/deconnexion.dart';
import '../sujets/subjectFilePage.dart';
import '../sujets/sellSubjectsPage.dart';
import '../sujets/buySubjectsPage.dart';
import '../journals/breedingJournalPage.dart';
import '../journals/purchaseJournalPage.dart';
import '../journals/salesJournalPage.dart';
import '../notations/ratingPage.dart';
import '../notifications/notificationPage.dart';
import '../setting/settingsPage.dart';
import '../dashordComptable/simpleDashboardPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
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
                      MaterialPageRoute(builder: (context) => NotificationPage()),
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
              icon: Icon(FontAwesomeIcons.user), // Icône utilisateur de FontAwesome
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
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubjectFilePage()),
          );
              break;
            case 2:
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SellSubjectsPage()),
            );
              break;
            case 3:
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PurchaseJournalPage()),
            );
              break;
            case 4:
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SalesJournalPage()),
            );
              break;
            case 6:
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleDashboardPage()),
            );
              break;
            case 7:
                  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationPage()),
            );
              break;
            case 8:
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BreedingJournalPage()),
            );
              break;
            case 9:
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuySubjectsPage()),
            );
              break;
            case 10:
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RatingPage()),
            );
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
      body: Center(
        child: Text('Contenu de la page d\'accueil'),
      ),
    );
  }
}
