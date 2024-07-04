import 'package:flutter/material.dart';
import './reproductionRabbit.dart'; // Import the reproduction rabbits data

class AddLitterFormScreen extends StatefulWidget {
  final ReproductionRabbit reproductionRabbit;

  const AddLitterFormScreen({required this.reproductionRabbit});

  @override
  _AddLitterFormScreenState createState() => _AddLitterFormScreenState();
}

class _AddLitterFormScreenState extends State<AddLitterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _date;
  late TimeOfDay _time;
  late int _quantity;
  late String _notes;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Ajouter une nouvelle portée pour ${widget.reproductionRabbit.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date de la portée'),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('${_date.day}/${_date.month}/${_date.year}'),
                onTap: _pickDate,
              ),
              SizedBox(height: 20),
              Text('Heure de la portée'),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('${_time.hour}:${_time.minute}'),
                onTap: _pickTime,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de lapereaux'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nombre de lapereaux';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notes'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer des notes sur la portée';
                  }
                  return null;
                },
                onSaved: (value) {
                  _notes = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveLitter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null) {
      setState(() {
        _time = pickedTime;
      });
    }
  }

  void _saveLitter() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create a new Litter object
      Litter newLitter = Litter(
        date: DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute),
        quantity: _quantity,
        notes: _notes,
      );

      // Update the list of litters for the rabbit
      widget.reproductionRabbit.litters.add(newLitter);

      // Navigate back to the previous screen (LitterDetailsScreen)
      Navigator.pop(context);
    }
  }
}
