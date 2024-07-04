import 'package:flutter/material.dart';
import 'package:projetlicence/screens/journals/addLitterScreen.dart';
import './reproductionRabbit.dart'; // Import the reproduction rabbits data


class LitterDetailsScreen extends StatelessWidget {
  final ReproductionRabbit reproductionRabbit;

  const LitterDetailsScreen({required this.reproductionRabbit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Détails de la portée de ${reproductionRabbit.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Liste des portées:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: reproductionRabbit.litters.length,
                itemBuilder: (context, index) {
                  var litter = reproductionRabbit.litters[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Portée ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Date: ${litter.date.day}/${litter.date.month}/${litter.date.year}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Quantité: ${litter.quantity} lapereaux',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Notes: ${litter.notes}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddLitterFormScreen(reproductionRabbit: reproductionRabbit),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}

