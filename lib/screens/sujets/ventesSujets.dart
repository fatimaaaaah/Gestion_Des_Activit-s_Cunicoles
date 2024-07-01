import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: VentesSujets(),
    theme: ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
      ),
    ),
  ));
}

class Rabbit {
  final String name;
  final int age;
  final File? image;

  Rabbit({required this.name, required this.age, this.image});
}

class VentesSujets extends StatefulWidget {
  @override
  _VentesSujetsState createState() => _VentesSujetsState();
}

class _VentesSujetsState extends State<VentesSujets> {
  final List<Rabbit> rabbits = [
    Rabbit(name: 'Lapin 1', age: 2),
    Rabbit(name: 'Lapin 2', age: 1),
    Rabbit(name: 'Lapin 3', age: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Mettre un Lapin en Vente',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rabbits.length,
              itemBuilder: (context, index) {
                var rabbit = rabbits[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: rabbit.image != null ? FileImage(rabbit.image!) : null,
                    child: rabbit.image == null ? Text('${index + 1}') : null,
                  ),
                  title: Text(rabbit.name, style: TextStyle(color: Colors.black)),
                  subtitle: Text('Âge: ${rabbit.age} ans', style: TextStyle(color: Colors.black)),
                  trailing: Icon(Icons.arrow_forward, color: Colors.black),
                  onTap: () {
                    _navigateToSellRabbit(context, rabbit);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _navigateToAddRabbit(context);
                },
                 backgroundColor: Colors.green,
                child: const Icon(Icons.add,color: Colors.black, ),
            ),)
          ),
        ],
      ),
    );
  }

  void _navigateToAddRabbit(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddRabbitScreen()),
    );

    if (result != null && result is Rabbit) {
      setState(() {
        rabbits.add(result);
      });
    }
  }

  void _navigateToSellRabbit(BuildContext context, Rabbit rabbit) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellRabbitScreen(rabbit: rabbit)),
    );

    if (result != null) {
    
    }
  }
}

class AddRabbitScreen extends StatefulWidget {
  @override
  _AddRabbitScreenState createState() => _AddRabbitScreenState();
}

class _AddRabbitScreenState extends State<AddRabbitScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Ajouter un nouveau lapin',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom du lapin',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Âge (ans)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            _image == null
                ? Text('Aucune image sélectionnée.', style: TextStyle(color: Colors.black))
                : Image.file(_image!),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: _pickImage,
              child: Text('Choisir une image',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                _saveNewRabbit(context);
              },
              child: Text('Enregistrer',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNewRabbit(BuildContext context) {
    String name = _nameController.text.trim();
    int age = int.tryParse(_ageController.text.trim()) ?? 0;

    if (name.isEmpty || age <= 0 || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs correctement')),
      );
      return;
    }

    Rabbit newRabbit = Rabbit(name: name, age: age, image: _image);
    Navigator.pop(context, newRabbit);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}

class SellRabbitScreen extends StatefulWidget {
  final Rabbit rabbit;

  SellRabbitScreen({required this.rabbit});

  @override
  _SellRabbitScreenState createState() => _SellRabbitScreenState();
}

class _SellRabbitScreenState extends State<SellRabbitScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mettre en vente ${widget.rabbit.name}',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${widget.rabbit.name}', style: TextStyle(color: Colors.black)),
            Text('Âge: ${widget.rabbit.age} ans', style: TextStyle(color: Colors.black)),
            widget.rabbit.image != null ? Image.file(widget.rabbit.image!) : Container(),
            SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[100],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Prix (CFA)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[100],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date de mise en vente',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    _dateController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                  }
                },
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
              ),
              onPressed: () {
                _sellRabbit(context);
              },
              child: Text('Mettre en vente',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  void _sellRabbit(BuildContext context) {
    double price = double.tryParse(_priceController.text.trim()) ?? 0.0;
    String date = _dateController.text.trim();

    if (price <= 0 || date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs correctement')),
      );
      return;
    }

    // Logic to sell the rabbit
    Navigator.pop(context, {'price': price, 'date': date});
  }

  @override
  void dispose() {
    _priceController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
