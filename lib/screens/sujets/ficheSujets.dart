import 'package:flutter/material.dart';
import '../../constants/rabbit.dart';

class FicheSujets extends StatelessWidget {
  final Rabbit rabbit;

  const FicheSujets({required this.rabbit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Fond de l'appBar vert
        title: Text('Fiche de ${rabbit.name}',
        style: TextStyle(
         fontWeight: FontWeight.bold,
          ),
        
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              rabbit.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Âge: ${rabbit.age} mois'),
            Text('Poids: ${rabbit.weight} kg'),
            SizedBox(height: 20.0),
            Text(
              'Informations supplémentaires sur ${rabbit.name}:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            const Text('Alimentation: Foin, légumes, granulés'),
            Text('Vaccinations: À jour'),
            Text('Historique médical: Aucune maladie récente'),
            Text('Performances reproductives: Mère de 2 portées'),
            SizedBox(height: 20.0),
            Text(
              'Dernière visite chez le vétérinaire:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Date: 2023-12-15'),
            Text('Notes: Check-up annuel'),
            SizedBox(height: 20.0),
            Text(
              'Remarques:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Lapin actif et en bonne santé.'),
            Text("Besoin d'une coupe de griffes bientôt."),
            // Ajoutez plus de détails sur le lapin ici
          ],
        ),
      ),
    );
  }
}
