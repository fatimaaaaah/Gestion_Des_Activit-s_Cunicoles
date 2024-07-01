import 'package:flutter/material.dart';
import 'package:projetlicence/screens/journals/journalAchats.dart';


class AddPurchaseScreen extends StatefulWidget {
  @override
  _AddPurchaseScreenState createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

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
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Catégorie'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantité'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  _saveNewPurchase(context);
                },
                child: Text('Enregistrer'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNewPurchase(BuildContext context) {
    String productName = _productNameController.text.trim();
    double price = double.tryParse(_priceController.text.trim()) ?? 0.0;
    String category = _categoryController.text.trim();
    int quantity = int.tryParse(_quantityController.text.trim()) ?? 0;

    if (productName.isEmpty || price <= 0 || category.isEmpty || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs correctement')),
      );
      return;
    }

    Purchase newPurchase = Purchase(productName: productName, price: price, date: DateTime.now(), category: category, quantity: quantity);
    Navigator.pop(context, newPurchase);
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
