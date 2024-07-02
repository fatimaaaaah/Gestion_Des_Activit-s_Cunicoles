import 'package:flutter/material.dart';

class Notation {
  final String buyerName;
  final double rating;
  final String comment;

  Notation({required this.buyerName, required this.rating, required this.comment});
}

class Notations extends StatelessWidget {
  final List<Notation> notations = [
    Notation(buyerName: 'Alice', rating: 4.5, comment: 'Très bon lapin, en bonne santé!'),
    Notation(buyerName: 'Bob', rating: 3.0, comment: 'Pas mal, mais pourrait être mieux.'),
    Notation(buyerName: 'Charlie', rating: 5.0, comment: 'Excellent, rien à redire!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
         backgroundColor: Colors.green,
        title: Text('Notations des Lapins vendues',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: notations.length,
        itemBuilder: (context, index) {
          final notation = notations[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(notation.buyerName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Note: ${notation.rating}'),
                  Text(notation.comment),
                ],
              ),
              leading: Icon(Icons.person),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Notations(),
  ));
}
