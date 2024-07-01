import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: JournalAchats(),
  ));
}

class Purchase {
  final String productName;
  final double price;
  final DateTime date;

  Purchase({
    required this.productName,
    required this.price,
    required this.date,
  });
}

class JournalAchats extends StatelessWidget {
  final List<Purchase> purchases = [
    Purchase(productName: 'Carottes', price: 1000.0, date: DateTime(2024, 6, 1)),
    Purchase(productName: 'Foin', price: 2000.0, date: DateTime(2024, 6, 5)),
    Purchase(productName: 'Médicament', price: 1500.0, date: DateTime(2024, 6, 10)),
    Purchase(productName: 'Bouteilles d\'eau', price: 500.0, date: DateTime(2024, 6, 15)),
    Purchase(productName: 'Litière', price: 1200.0, date: DateTime(2024, 6, 20)),
    Purchase(productName: 'Jouets', price: 800.0, date: DateTime(2024, 6, 25)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Achats'),
      ),
      body: ListView.builder(
        itemCount: purchases.length + 1,
        itemBuilder: (context, index) {
          if (index == purchases.length) {
            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.add)),
              title: Text('Ajouter un nouvel achat'),
              onTap: () {
                _navigateToAddPurchase(context);
              },
            );
          }

          var purchase = purchases[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(purchase.productName),
            subtitle: Text('${purchase.price.toStringAsFixed(2)} CFA - ${purchase.date.day}/${purchase.date.month}/${purchase.date.year}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Action when tapping on the purchase history item
              // For example, navigate to a detailed view of the purchase
            },
          );
        },
      ),
    );
  }

  void _navigateToAddPurchase(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPurchaseScreen()),
    );
  }
}

class AddPurchaseScreen extends StatelessWidget {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouvel achat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Nom du produit'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Prix (CFA)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveNewPurchase(context);
              },
              child: Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNewPurchase(BuildContext context) {
    String productName = _productNameController.text.trim();
    double price = double.tryParse(_priceController.text.trim()) ?? 0.0;

    if (productName.isEmpty || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs correctement')),
      );
      return;
    }

    Purchase newPurchase = Purchase(productName: productName, price: price, date: DateTime.now());
    Navigator.pop(context, newPurchase);
  }


}
