import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './screens/authentification/splashScreen.dart';
import './screens/authentification/home_page.dart';
import './screens/sujets/subjectFilePage.dart';
import './screens/sujets/sellSubjectsPage.dart';
import './screens/sujets/buySubjectsPage.dart';
import './screens/journals/breedingJournalPage.dart';
import './screens/journals/purchaseJournalPage.dart';
import './screens/journals/salesJournalPage.dart';
import './screens/notations/ratingPage.dart';
import './screens/notifications/notificationPage.dart';
import './screens/setting/settingsPage.dart';
import './screens/dashordComptable/simpleDashboardPage.dart';
import './screens/drawer/drawer_screen.dart';
import './screens/profil/profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion des activités cunicoles',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/', // Route initiale, si nécessaire
      routes: {
        '/': (context) => SplashScreen(), // Route initiale, si nécessaire
        '/home': (context) => HomePage(),
        '/subjectFile': (context) => SubjectFilePage(),
        '/sellSubjects': (context) => SellSubjectsPage(),
        '/buySubjects': (context) => BuySubjectsPage(),
        '/breedingJournal': (context) => BreedingJournalPage(),
        '/purchaseJournal': (context) => PurchaseJournalPage(),
        '/salesJournal': (context) => SalesJournalPage(),
        '/rating': (context) => RatingPage(),
        '/notification': (context) => NotificationPage(),
        '/settings': (context) => SettingsPage(),
        '/simpleDashboard': (context) => SimpleDashboardPage(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

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
                  // Logique à exécuter lors du clic sur l'icône de notification
                  Navigator.pushNamed(context, '/notification'); // Exemple de navigation
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
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/profile.jpg'), // Remplacez par votre image de profil
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
          // Gérer la déconnexion ici
          // Par exemple, afficher une boîte de dialogue comme dans DeconnexionPage
        },
      ),
      body: Center(
        child: Text('Contenu de la page d\'accueil'),
      ),
    );
  }
}
