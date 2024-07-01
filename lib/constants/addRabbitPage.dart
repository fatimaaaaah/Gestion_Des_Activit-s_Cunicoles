import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:projetlicence/constants/rabbit.dart';

class AddRabbitForm extends StatefulWidget {
  final Function(Rabbit) onAddRabbit;

  AddRabbitForm({required this.onAddRabbit});

  @override
  _AddRabbitFormState createState() => _AddRabbitFormState();
}

class _AddRabbitFormState extends State<AddRabbitForm> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Aucune image sélectionnée.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un nouveau lapin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nom du lapin'),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Âge (mois)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Poids (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Sexe'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Sélectionner une image'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Rabbit newRabbit = Rabbit(
                  name: nameController.text,
                  age: int.parse(ageController.text),
                  weight: double.parse(weightController.text),
                  gender: genderController.text,
                  imagePath: _image != null ? _image!.path : null,
                );
                widget.onAddRabbit(newRabbit);
                Navigator.pop(context); // Retourner à la page précédente
              },
              child: Text('Ajouter le lapin'),
            ),
          ],
        ),
      ),
    );
  }
}
