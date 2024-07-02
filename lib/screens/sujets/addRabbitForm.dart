import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import '../../constants/rabbit.dart';

class AddRabbitForm extends StatefulWidget {
  final Function(Rabbit) onAddRabbit;

  AddRabbitForm({required this.onAddRabbit});

  @override
  _AddRabbitFormState createState() => _AddRabbitFormState();
}

class _AddRabbitFormState extends State<AddRabbitForm> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Lapin',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                onTap: getImage,
                child: _image == null
                    ? Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.add_a_photo),
                        ),
                      )
                    : kIsWeb
                        ? Image.asset(
                            _image!.path,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _image!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nom du Lapin',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Âge (mois)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: 'Poids (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                items: ['Male', 'Femelle']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Sexe',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
             ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(
                color: Colors.white,
                 fontSize: 10, 
                 fontStyle: FontStyle.normal),
          ),
          onPressed: () {},
          child: const Text('Ajouter ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Aucune image sélectionnée.');
      }
    });
  }

  void _addRabbit() {
    if (nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        _selectedGender != null &&
        _image != null) {
      Rabbit newRabbit = Rabbit(
        name: nameController.text,
        age: int.parse(ageController.text),
        weight: double.parse(weightController.text),
        gender: _selectedGender!,
        imagePath: _image!.path,
      );

      widget.onAddRabbit(newRabbit);

      // Reset form state
      nameController.clear();
      ageController.clear();
      weightController.clear();
      setState(() {
        _selectedGender = null;
        _image = null;
      });

      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Veuillez remplir tous les champs et sélectionner une image.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
