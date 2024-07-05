import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/rabbit.dart';

class EditRabbitForm extends StatefulWidget {
  final Rabbit rabbit;

  EditRabbitForm({required this.rabbit});

  @override
  _EditRabbitFormState createState() => _EditRabbitFormState();
}

class _EditRabbitFormState extends State<EditRabbitForm> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.rabbit.name;
    ageController.text = widget.rabbit.age.toString();
    weightController.text = widget.rabbit.weight.toString();
    genderController.text = widget.rabbit.gender;
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
        title: Text('Modifier le lapin'),
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
                Rabbit updatedRabbit = Rabbit(
                  name: nameController.text,
                  age: int.parse(ageController.text),
                  weight: double.parse(weightController.text),
                  gender: genderController.text,
                  imagePath: _image?.path ?? widget.rabbit.imagePath,
                );

                Navigator.pop(context, updatedRabbit);
              },
              child: Text('Enregistrer les modifications'),
            ),
          ],
        ),
      ),
    );
  }
}
