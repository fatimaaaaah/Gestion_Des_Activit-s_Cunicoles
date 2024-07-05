import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:projetlicence/screens/acceuil/home.dart';
import 'package:projetlicence/screens/alimentation/alimentation.dart';
import 'package:projetlicence/screens/authentification/splashScreen.dart';
import 'package:projetlicence/screens/journals/journalAchats.dart';
import 'package:projetlicence/screens/profil/profil.dart';
import 'package:projetlicence/screens/deconnexion/deconnexion.dart';
import 'package:projetlicence/screens/sujets/gestionsSubject.dart';
import 'package:projetlicence/screens/sujets/ventesSujets.dart';
import 'package:projetlicence/screens/sujets/achatsSujets.dart';
import 'package:projetlicence/screens/journals/journalReproduction.dart';
import 'package:projetlicence/screens/journals/journalVaccination.dart';
import 'package:projetlicence/screens/journals/journalVente.dart';
import 'package:projetlicence/screens/notations/notations.dart';
import 'package:projetlicence/screens/notifications/notifcation_tap.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion des activités cunicoles',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const HomePage(),
        '/alimentation': (context) =>  AlimentationPage(),
        '/gestion_sujets': (context) => GestionsSujets(),
        '/ventes_sujets': (context) => VentesSujets(),
        '/achats_sujets': (context) => AchatsSujets(),
        '/journal_reproduction': (context) => JournalReproduction(),
        '/journal_vaccination': (context) => JournalVaccination(),
        '/journal_vente': (context) => JournalVente(),
        '/journal_achat': (context) => JournalAchats(),
        '/notations': (context) => Notations(),
        '/notifications': (context) => NotitcationTap(),
        '/profil': (context) => ProfileScreen(),
        '/deconnexion': (context) => const DeconnexionPage(),
      },

    );
  }
}
