import 'package:flutter/material.dart';

class AlimentationPage extends StatefulWidget {
  @override
  _AlimentationPageState createState() => _AlimentationPageState();
}

class _AlimentationPageState extends State<AlimentationPage> {
  final List<Map<String, dynamic>> _foodStock = [
    {'name': 'Foin', 'quantity': 10},
    {'name': 'Granulés', 'quantity': 5},
    {'name': 'Légumes', 'quantity': 8},
    {'name': 'Fruits', 'quantity': 6},
  ];

  final _foodNameController = TextEditingController();
  final _foodQuantityController = TextEditingController();
  final _consumeQuantityController = TextEditingController();
  final _rabbitIdController = TextEditingController();
  final _dailyConsumptionController = TextEditingController();

  void _addFood() {
    final String name = _foodNameController.text;
    final int quantity = int.tryParse(_foodQuantityController.text) ?? 0;

    if (name.isNotEmpty && quantity > 0) {
      setState(() {
        _foodStock.add({'name': name, 'quantity': quantity});
      });

      _foodNameController.clear();
      _foodQuantityController.clear();
    }
  }

  void _consumeFood(int index) {
    final int quantity = int.tryParse(_consumeQuantityController.text) ?? 0;

    if (quantity > 0 && _foodStock[index]['quantity'] >= quantity) {
      setState(() {
        _foodStock[index]['quantity'] -= quantity;
      });

      _consumeQuantityController.clear();
    }
  }

  void _trackDailyConsumption() {
    final String rabbitId = _rabbitIdController.text;
    final int dailyConsumption =
        int.tryParse(_dailyConsumptionController.text) ?? 0;

    if (rabbitId.isNotEmpty && dailyConsumption > 0) {
      _rabbitIdController.clear();
      _dailyConsumptionController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Consommation journalière enregistrée pour le lapin $rabbitId')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Veuillez saisir un identifiant de lapin valide et une quantité de consommation.')),
      );
    }
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _foodQuantityController.dispose();
    _consumeQuantityController.dispose();
    _rabbitIdController.dispose();
    _dailyConsumptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alimentation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildFoodListSection(),
            _buildDailyConsumptionSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddFoodDialog(context),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFoodListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSectionTitle('Liste des Aliments'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _foodStock.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_foodStock[index]['name']),
                trailing: Text('${_foodStock[index]['quantity']} kg'),
                onTap: () => _showConsumeFoodDialog(context, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDailyConsumptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSectionTitle('Suivi de la Consommation Journalière'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _rabbitIdController,
                decoration:
                    const InputDecoration(labelText: 'Identifiant du Lapin'),
              ),
              TextField(
                controller: _dailyConsumptionController,
                decoration:
                    const InputDecoration(labelText: 'Quantité Consommée (kg)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _trackDailyConsumption,
                child: const Text('Enregistrer la Consommation'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddFoodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter un Nouvel Aliment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _foodNameController,
                  decoration:
                      const InputDecoration(labelText: 'Nom de l\'aliment'),
                ),
                TextField(
                  controller: _foodQuantityController,
                  decoration: const InputDecoration(labelText: 'Quantité (kg)'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _addFood();
                Navigator.of(context).pop();
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  void _showConsumeFoodDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consommer de la Nourriture'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Quantité disponible : ${_foodStock[index]['quantity']} kg'),
                TextField(
                  controller: _consumeQuantityController,
                  decoration: const InputDecoration(
                      labelText: 'Quantité à Consommer (kg)'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _consumeFood(index);
                Navigator.of(context).pop();
              },
              child: const Text('Consommer'),
            ),
          ],
        );
      },
    );
  }
}
