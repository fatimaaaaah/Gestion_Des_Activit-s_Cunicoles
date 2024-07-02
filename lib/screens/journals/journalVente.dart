import 'package:flutter/material.dart';

class Vente {
  final String date;
  final int quantity;
  final double amount;
  final String description;

  Vente({
    required this.date,
    required this.quantity,
    required this.amount,
    required this.description,
  });
}

class JournalVente extends StatefulWidget {
  @override
  _JournalVenteState createState() => _JournalVenteState();
}

class _JournalVenteState extends State<JournalVente> {
  final List<Vente> ventes = [
    Vente(
      date: '2024-06-01',
      quantity: 10,
      amount: 200.0,
      description: 'Vente de 10 lapins à un agriculteur local.',
    ),
    Vente(
      date: '2024-06-15',
      quantity: 5,
      amount: 100.0,
      description: 'Vente de 5 lapins pour un événement communautaire.',
    ),
    Vente(
      date: '2024-06-20',
      quantity: 7,
      amount: 140.0,
      description: 'Vente de 7 lapins à une famille pour des animaux de compagnie.',
    ),
  ];

  void _addVente(Vente vente) {
    setState(() {
      ventes.add(vente);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
         centerTitle: true,
        title: Text(
          'Journal des ventes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: ventes.length,
        itemBuilder: (context, index) {
          final vente = ventes[index];
          return Card(
            child: ListTile(
              title: Text('Date: ${vente.date}'),
              subtitle: Text('Quantité: ${vente.quantity}\nMontant: ${vente.amount} CFA'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailVente(vente: vente),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddVentePage(onAdd: _addVente),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailVente extends StatelessWidget {
  final Vente vente;

  DetailVente({required this.vente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Détails de la vente',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${vente.date}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Quantité: ${vente.quantity}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Montant: ${vente.amount} CFA',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              vente.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class AddVentePage extends StatefulWidget {
  final Function(Vente) onAdd;

  AddVentePage({required this.onAdd});

  @override
  _AddVentePageState createState() => _AddVentePageState();
}

class _AddVentePageState extends State<AddVentePage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _quantityController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final vente = Vente(
        date: _dateController.text,
        quantity: int.parse(_quantityController.text),
        amount: double.parse(_amountController.text),
        description: _descriptionController.text,
      );
      widget.onAdd(vente);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
         centerTitle: true,
        title: Text(
          'Ajouter une vente',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantité'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la quantité';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Montant (CFA)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le montant';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Ajouter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: JournalVente(),
  ));
}
