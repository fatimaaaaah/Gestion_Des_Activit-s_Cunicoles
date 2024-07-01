import 'package:flutter/material.dart';

class JournalVaccination extends StatelessWidget {
  final List<Map<String, dynamic>> _vaccinationHistory = [
    {
      'rabbitId': 'R001',
      'treatmentType': 'Vaccination contre la Myxomatose',
      'dateAdministered': DateTime(2024, 6, 15),
    },
    {
      'rabbitId': 'R002',
      'treatmentType': 'Vaccination contre la VHD',
      'dateAdministered': DateTime(2024, 6, 20),
    },
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal des Vaccinations'),
      ),
      body: ListView.builder(
        itemCount: _vaccinationHistory.length,
        itemBuilder: (context, index) {
          var record = _vaccinationHistory[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(record['rabbitId']),
            ),
            title: Text(record['treatmentType']),
            subtitle: Text('Administée le ${record['dateAdministered'].toString()}'),
            onTap: () {
              // Handle tap if needed
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
        child: Icon(Icons.add),
      ),
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
        title: Text('Nouvelle Fiche Médicale'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'ID du Lapin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'ID du Lapin';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rabbitId = value!;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type de Traitement'),
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Simulate saving the medical record
                    _saveMedicalRecord();
                    Navigator.pop(context);
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveMedicalRecord() {
    // Simulate saving the medical record to a local list or database
    final newRecord = {
      'rabbitId': _rabbitId,
      'treatmentType': _treatmentType,
      'dateAdministered': DateTime.now(),
    };
    // Handle saving to actual storage if needed
    print('Saved medical record: $newRecord');
  }
}
