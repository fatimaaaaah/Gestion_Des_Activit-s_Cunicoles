import 'package:flutter/material.dart';

class Lapin {
  final String nom;
  final String age;
  final String poids;
  final int prix;
  final String image;

  Lapin({
    required this.nom,
    required this.age,
    required this.poids,
    required this.prix,
    required this.image,
  });
}

class DetailLapin extends StatelessWidget {
  final Lapin lapin;

  DetailLapin({required this.lapin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de ${lapin.nom}',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                lapin.image,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              lapin.nom,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Âge: ${lapin.age}'),
            Text('Poids: ${lapin.poids}'),
            SizedBox(height: 20.0),
            Text(
              'Informations supplémentaires sur ${lapin.nom}:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Vaccinations: À jour'),
            Text('Historique médical: Aucune maladie récente'),
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
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Achat de ${lapin.nom}'),
                      content: Text('Vous avez acheté ${lapin.nom} pour ${lapin.prix} CFA.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Acheter (${lapin.prix} CFA)',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AchatsSujets extends StatelessWidget {
  final List<Lapin> lapins = [
    Lapin(
      nom: 'Lapin 1',
      age: '6 mois',
      poids: '2.5 kg',
      prix: 25000,
      image: '../../../assets/images/achatsLapins/background.jpg',
    ),
    Lapin(
      nom: 'Lapin 2',
      age: '8 mois',
      poids: '3.0 kg',
      prix: 30000,
      image: '../../../assets/images/achatsLapins/background.jpg',
    ),
    // Ajoutez d'autres lapins ici avec leurs détails
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achat de sujets',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Liste des Lapins Disponibles',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: lapins.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(lapins[index].nom),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Âge: ${lapins[index].age}'),
                        Text('Poids: ${lapins[index].poids}'),
                      ],
                    ),
                    trailing: Text('${lapins[index].prix} CFA'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailLapin(lapin: lapins[index])),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Achat de sujets',
    home: AchatsSujets(),
  ));
}
