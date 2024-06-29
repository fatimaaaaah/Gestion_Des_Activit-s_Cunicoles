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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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
        '/deconexion': (context) => ProfileScreen(),
      },
    );
  }
}

