import 'package:flutter/material.dart';
import 'package:projetlicence/screens/journals/dd_purchase_screen.dart';


class Purchase {
  final String productName;
  final double price;
  final DateTime date;
  final String category;
  final int quantity;

  Purchase({
    required this.productName,
    required this.price,
    required this.date,
    required this.category,
    required this.quantity,
  });
}

class JournalAchats extends StatelessWidget {
  final List<Purchase> purchases = [
    Purchase(productName: 'Carottes', price: 1000.0, date: DateTime(2024, 6, 1), category: 'Nourriture', quantity: 2),
    Purchase(productName: 'Foin', price: 2000.0, date: DateTime(2024, 6, 5), category: 'Nourriture', quantity: 1),
    Purchase(productName: 'Médicament', price: 1500.0, date: DateTime(2024, 6, 10), category: 'Matériel', quantity: 3),
    Purchase(productName: 'Bouteilles d\'eau', price: 500.0, date: DateTime(2024, 6, 15), category: 'Matériel', quantity: 5),
    Purchase(productName: 'Guindo', price: 5000.0, date: DateTime(2024, 6, 20), category: 'Lapin', quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
        title: Text('Historique des Achats',
         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          var purchase = purchases[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('${index + 1}', style: TextStyle(color: Colors.white)),
            ),
            title: Text(purchase.productName),
            subtitle: Text('${purchase.price.toStringAsFixed(2)} CFA - ${purchase.date.day}/${purchase.date.month}/${purchase.date.year}\nQuantité: ${purchase.quantity}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _navigateToAddPurchase(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _navigateToAddPurchase(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPurchaseScreen()),
    );
  }
}

void main() {
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
    home: JournalAchats(),
  ));
}

