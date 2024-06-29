import 'package:flutter/material.dart';

class SubjectFilePage extends StatelessWidget {
  final List<Rabbit> rabbits = [
    Rabbit(name: "Lapin 1", age: 6, weight: 2.5),
    Rabbit(name: "Lapin 2", age: 8, weight: 3.0),
    Rabbit(name: "Lapin 3", age: 4, weight: 2.8),
    // Ajoutez plus de lapins ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestions des Sujets'),
      ),
      body: ListView.builder(
        itemCount: rabbits.length,
        itemBuilder: (context, index) {
          return RabbitCard(rabbit: rabbits[index]);
        },
      ),
    );
  }
}

class Rabbit {
  final String name;
  final int age;
  final double weight;

  Rabbit({required this.name, required this.age, required this.weight});
}

class RabbitCard extends StatelessWidget {
  final Rabbit rabbit;

  const RabbitCard({required this.rabbit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              rabbit.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Âge: ${rabbit.age} mois'),
            Text('Poids: ${rabbit.weight} kg'),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page de détails du lapin
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RabbitDetailPage(rabbit: rabbit),
                    ),
                  );
                },
                child: Text('Voir Plus'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RabbitDetailPage extends StatelessWidget {
  final Rabbit rabbit;

  const RabbitDetailPage({required this.rabbit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rabbit.name),
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
            // Ajoutez plus de détails sur le lapin ici
          ],
        ),
      ),
    );
  }
}
