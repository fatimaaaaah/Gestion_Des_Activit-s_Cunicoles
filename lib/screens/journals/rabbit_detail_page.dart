import 'package:flutter/material.dart';

class Rabbit {
  final String name;
  final int age;
  final double weight;
  final String breed;
  final String healthStatus;
  final String reproductionHistory;
  final String vaccinationHistory;

  Rabbit({
    required this.name,
    required this.age,
    required this.weight,
    required this.breed,
    required this.healthStatus,
    required this.reproductionHistory,
    required this.vaccinationHistory,
  });
}

class RabbitDetailPage extends StatelessWidget {
  final Rabbit rabbit;

  const RabbitDetailPage({required this.rabbit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Fiche de ${rabbit.name}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
            Text('Race: ${rabbit.breed}'),
            Text('État de santé: ${rabbit.healthStatus}'),
            Text('Historique de reproduction: ${rabbit.reproductionHistory}'),
            Text('Historique de vaccination: ${rabbit.vaccinationHistory}'),
            // Ajoutez plus de détails sur le lapin ici
          ],
        ),
      ),
    );
  }
}


