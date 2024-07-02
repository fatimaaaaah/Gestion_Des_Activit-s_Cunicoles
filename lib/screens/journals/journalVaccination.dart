import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: JournalVaccination(),
    theme: ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green, // Couleur de l'AppBar en vert
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

class JournalVaccination extends StatelessWidget {
  final List<Map<String, dynamic>> _vaccinationHistory = [
    {
      'rabbit': Rabbit(name: 'Lapin 1', age: 2),
      'treatmentType': 'Vaccination contre la Myxomatose',
      'dateAdministered': DateTime(2024, 6, 15, 10, 30), // Exemple avec heure
    },
    {
      'rabbit': Rabbit(name: 'Lapin 2', age: 1),
      'treatmentType': 'Vaccination contre la VHD',
      'dateAdministered': DateTime(2024, 6, 20, 9, 0), // Exemple avec heure
    },
    // Ajoutez plus de données factices au besoin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal des Vaccinations'),
      ),
      body: ListView.builder(
        itemCount: _vaccinationHistory.length,
        itemBuilder: (context, index) {
          var record = _vaccinationHistory[index];
          Rabbit rabbit = record['rabbit'];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green, // Fond du CircleAvatar en vert
              child: Text(rabbit.name[0],
                  style: const TextStyle(color: Colors.white)),
            ),
            title: Text(rabbit.name),
            subtitle: Text(
                'Vaccination contre ${record['treatmentType']}\nAdministérée le ${_formatDate(record['dateAdministered'])}'),
            onTap: () {
              _showDetailsDialog(context, record);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalRecordForm()),
          );
        },
        backgroundColor: Colors.green, // Fond du bouton en vert
        child: const Icon(Icons.add, color: Colors.white), // Icône blanche
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}:${dateTime.minute}';
  }

  void _showDetailsDialog(BuildContext context, Map<String, dynamic> record) {
    Rabbit rabbit = record['rabbit'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Détails de la Vaccination'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nom du Lapin: ${rabbit.name}'),
              const SizedBox(height: 8),
              Text('Âge: ${rabbit.age} ans'),
              const SizedBox(height: 8),
              Text('Type de Traitement: ${record['treatmentType']}'),
              const SizedBox(height: 8),
              Text(
                  'Date d\'administration: ${_formatDate(record['dateAdministered'])}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class MedicalRecordForm extends StatefulWidget {
  @override
  _MedicalRecordFormState createState() => _MedicalRecordFormState();
}

class _MedicalRecordFormState extends State<MedicalRecordForm> {
  final _formKey = GlobalKey<FormState>();
  String _rabbitId = '';
  String _treatmentType = '';
  DateTime? _dateAdministered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle Fiche Médicale'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom du Lapin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du Lapin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rabbitId = value!;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Type de Traitement'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le type de traitement';
                  }
                  return null;
                },
                onSaved: (value) {
                  _treatmentType = value!;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date de l\'administration',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            _dateAdministered = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              pickedTime.hour,
                              pickedTime.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                ),
                validator: (value) {
                  if (_dateAdministered == null) {
                    return 'Veuillez sélectionner une date et une heure';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _saveMedicalRecord();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Fond du bouton en vert
                ),
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveMedicalRecord() {
    final newRecord = {
      'rabbitId': _rabbitId,
      'treatmentType': _treatmentType,
      'dateAdministered': _dateAdministered,
    };
    print('Saved medical record: $newRecord');
  }
}
