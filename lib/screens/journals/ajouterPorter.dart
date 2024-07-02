import 'package:flutter/material.dart';
import './femelleRabbit.dart';

class AjouterPorteeScreen extends StatefulWidget {
  @override
  _AjouterPorteeScreenState createState() => _AjouterPorteeScreenState();
}

class _AjouterPorteeScreenState extends State<AjouterPorteeScreen> {
  late TextEditingController nombreController;
  late TextEditingController namefemelle;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController();
    namefemelle = TextEditingController();
  }

  @override
  void dispose() {
    nombreController.dispose();
    namefemelle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
         centerTitle: true,
        title: Text('Ajouter une Nouvelle Portée',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('Détails de la Portée'),
              _buildTextInputField('Nom de la femelle', namefemelle, TextInputType.text),
              _buildTextInputField('Nombre de lapereaux', nombreController, TextInputType.number),
              _buildDateField('Date de mise bas', selectedDate),
              _buildTimeField('Heure de mise bas', selectedTime),
             
              SizedBox(height: 20),
              _buildSectionTitle('Actions'),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  _validateAndSave(context);
                },
                child: const Text(
                  'Enregistrer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: inputType,
      ),
    );
  }

  Widget _buildDateField(String labelText, DateTime? selectedDate) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(labelText),
        trailing: Text(selectedDate != null ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}' : 'Sélectionner'),
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null && pickedDate != selectedDate) {
            setState(() {
              this.selectedDate = pickedDate;
            });
          }
        },
      ),
    );
  }

  Widget _buildTimeField(String labelText, TimeOfDay? selectedTime) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(labelText),
        trailing: Text(selectedTime != null ? '${selectedTime.hour}:${selectedTime.minute}' : 'Sélectionner'),
        onTap: () async {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: selectedTime ?? TimeOfDay.now(),
          );
          if (pickedTime != null && pickedTime != selectedTime) {
            setState(() {
              this.selectedTime = pickedTime;
            });
          }
        },
      ),
    );
  }

  void _validateAndSave(BuildContext context) {
    // Valider et enregistrer les détails de la portée
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nouvelle portée enregistrée avec succès!')),
    );
  }
}
