import 'package:flutter/material.dart';
import 'package:projetlicence/screens/journals/femelleRabbit.dart';

class PorteeDetailsScreen extends StatefulWidget {
  final FemaleRabbit femelle;

  PorteeDetailsScreen({required this.femelle});

  @override
  _PorteeDetailsScreenState createState() => _PorteeDetailsScreenState();
}

class _PorteeDetailsScreenState extends State<PorteeDetailsScreen> {
  late TextEditingController nameController;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late TextEditingController quantityController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.femelle.name);
    quantityController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Détails de ${widget.femelle.name}',
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
              _buildSectionTitle('Modifier les Détails'),
              _buildTextInputField('Nom de la femelle', nameController),
              _buildPorteesList(widget.femelle.portees),
              SizedBox(height: 20),
              _buildSectionTitle('Ajouter une Nouvelle Portée'),
              _buildDateField('Date de mise bas', selectedDate),
              _buildTimeField('Heure de mise bas', selectedTime),
              _buildTextInputField('Nombre de lapereaux', quantityController, TextInputType.number),
              _buildTextInputField('Notes supplémentaires', notesController),
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

  Widget _buildPorteesList(List<Portee> portees) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle('Portées Précédentes'),
        SizedBox(height: 10),
        if (portees.isEmpty)
          Center(
            child: Text('Aucune portée enregistrée'),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: portees.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Portée du ${portees[index].date.day}/${portees[index].date.month}/${portees[index].date.year}'),
                subtitle: Text('Nombre: ${portees[index].quantity}'),
                onTap: () {
                  // Option pour modifier la portée
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Modifier la Portée'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Date: ${portees[index].date.day}/${portees[index].date.month}/${portees[index].date.year}'),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(labelText: 'Nombre de lapereaux'),
                              keyboardType: TextInputType.number,
                              controller: TextEditingController(text: portees[index].quantity.toString()),
                              onChanged: (value) {
                                portees[index].quantity = int.tryParse(value) ?? 0;
                              },
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(labelText: 'Notes supplémentaires'),
                              controller: TextEditingController(text: portees[index].notes),
                              onChanged: (value) {
                                portees[index].notes = value;
                              },
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                // Sauvegarde des modifications
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text('Enregistrer'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
      ],
    );
  }

  void _validateAndSave(BuildContext context) {
    // Valider et enregistrer les détails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Détails enregistrés avec succès!')),
    );
  }
}
