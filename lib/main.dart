import 'package:flutter/material.dart';
import 'package:projetlicence/screens/acceuil/home.dart';
import 'package:projetlicence/screens/authentification/splashScreen.dart';
import 'package:projetlicence/screens/profil/profil.dart';
import 'package:projetlicence/screens/deconnexion/deconnexion.dart';
import 'package:projetlicence/screens/sujets/ficheSujets.dart';
import 'package:projetlicence/screens/sujets/gestionsSubject.dart';
import 'package:projetlicence/screens/sujets/sellSubjectsPage.dart';
import 'package:projetlicence/screens/sujets/buySubjectsPage.dart';
import 'package:projetlicence/screens/journals/breedingJournalPage.dart';
import 'package:projetlicence/screens/journals/purchaseJournalPage.dart';
import 'package:projetlicence/screens/journals/salesJournalPage.dart';
import 'package:projetlicence/screens/notations/ratingPage.dart';
import 'package:projetlicence/screens/notifications/notifcation_tap.dart';
import 'package:projetlicence/screens/acceuil/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des activités cunicoles',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const HomePage(),
        '/gestion_sujets': (context) => GestionsSujets(),
        '/sell_subjects': (context) => SellSubjectsPage(),
        '/purchase_journal': (context) => PurchaseJournalPage(),
        '/sales_journal': (context) => SalesJournalPage(),
        '/notification_tap': (context) => NotitcationTap(),
        '/breeding_journal': (context) => BreedingJournalPage(),
        '/buy_subjects': (context) => BuySubjectsPage(),
        '/rating_page': (context) => RatingPage(),
        '/profil': (context) => ProfileScreen(),
        '/deconnexion': (context) => DeconnexionPage(),
      },

    );
  }
}
