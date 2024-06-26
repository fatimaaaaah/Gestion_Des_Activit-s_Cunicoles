import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/drawer_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
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
