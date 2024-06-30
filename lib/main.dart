import 'package:flutter/material.dart';
import 'package:projetlicence/screens/deconnexion/deconnexion.dart';
import 'package:projetlicence/screens/sujets/sellSubjectsPage.dart';
import './screens/authentification/splashScreen.dart';
import './screens/authentification/home_page.dart';
import './screens/sujets/ficheSujets.dart';
import './screens/sujets/gestionsSubject.dart';
import './screens/sujets/buySubjectsPage.dart';
import './screens/journals/breedingJournalPage.dart';
import './screens/journals/purchaseJournalPage.dart';
import './screens/journals/salesJournalPage.dart';
import './screens/notations/ratingPage.dart';
import './screens/notifications/notifcation_tap.dart';
import './constants/rabbit.dart'; // Import Rabbit class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion des activités cunicoles',
      initialRoute: '/', // Route initiale, si nécessaire
      onGenerateRoute: (settings) {
        if (settings.name == '/fiche_sujets') {
          final rabbit = settings.arguments as Rabbit;
          return MaterialPageRoute(
            builder: (context) => FicheSujets(rabbit: rabbit),
          );
        }
        // Define other routes similarly if needed
        return null;
      },
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/gestion_sujets': (context) => GestionsSujets(),
        '/sell_subjects': (context) => SellSubjectsPage(),
        '/purchase_journal': (context) => PurchaseJournalPage(),
        '/sales_journal': (context) => SalesJournalPage(),
        '/notification_tap': (context) => NotitcationTap(),
        '/breeding_journal': (context) => BreedingJournalPage(),
        '/buy_subjects': (context) => BuySubjectsPage(),
        '/rating_page': (context) => RatingPage(),
        '/deconnexion': (context) => const DeconnexionPage(),
      },
    );
  }
}
