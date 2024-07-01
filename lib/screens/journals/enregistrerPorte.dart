import 'package:flutter/material.dart';

class EnregistrerPorteScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Enregistrer une Portée'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('Informations sur la Portée'),
            _buildTextInputField('Nom de la femelle', nameController),
            _buildTextInputField('Date de mise bas', dateController, TextInputType.datetime),
            _buildTextInputField('Nombre de lapereaux', quantityController, TextInputType.number),
            _buildTextInputField('Notes supplémentaires', notesController),
            SizedBox(height: 20),
            _buildSectionTitle('Actions'),
            ElevatedButton(
              onPressed: () {
                _validateAndSave(context);
              },
              child: Text('Valider'),
            ),
            ElevatedButton(
              onPressed: () {
                _createInformationSheet(context);
              },
              child: Text('Créer une Fiche d\'Information'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextInputField(String labelText, TextEditingController controller, [TextInputType inputType = TextInputType.text]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      keyboardType: inputType,
    );
  }

  void _validateAndSave(BuildContext context) {
    // Add your form validation logic here
    // For simplicity, we'll show a snackbar and pop the screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Portée enregistrée avec succès!')),
    );
    Navigator.of(context).pop();
  }

  void _createInformationSheet(BuildContext context) {
    // Add logic to create information sheet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fiche d\'information créée avec succès!')),
    );
  }
}
