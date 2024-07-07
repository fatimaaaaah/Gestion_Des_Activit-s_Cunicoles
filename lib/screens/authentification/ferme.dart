import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../authentification/signup.dart';
import '../description/description.dart';
import '../../services/firebase_service.dart'; // Importez le service Firebase

class FermePage extends StatelessWidget {
  final TextEditingController _nomFermeController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _dateCreationController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Succès'),
          content: Text('La ferme a été ajoutée avec succès.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MySliderScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addFarm(BuildContext context) async {
    final String nomFerme = _nomFermeController.text;
    final String adresse = _adresseController.text;
    final String dateCreation = _dateCreationController.text;

    if (nomFerme.isEmpty || adresse.isEmpty || dateCreation.isEmpty) {
      _showErrorDialog(context, 'Veuillez remplir tous les champs.');
      return;
    }

    DateTime? creationDate;
    try {
      creationDate = DateFormat("dd/MM/yyyy").parseStrict(dateCreation);
    } catch (e) {
      _showErrorDialog(
          context, 'Format de date invalide. Veuillez utiliser JJ/MM/AAAA.');
      return;
    }

    try {
      // Utilisez FirebaseService pour ajouter une ferme sans utiliser uid
      await _firebaseService.addFarm(
        farmName: nomFerme,
        address: adresse,
        creationDate: creationDate,
        uid:
            "temporary-uid", // Utilisez un uid temporaire ou ajustez la logique selon vos besoins
      );

      _showSuccessDialog(context);
    } catch (e) {
      print('Erreur lors de l\'ajout de la ferme : $e');
      _showErrorDialog(
          context, 'Erreur lors de l\'ajout de la ferme. Veuillez réessayer.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "assets/images/logo/images.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Gestion des activités cunicoles",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Ces informations nous permettrons de mieux vous connaître",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        InputField(
                          label: "Nom de la ferme",
                          controller: _nomFermeController,
                        ),
                        SizedBox(height: 10),
                        InputField(
                          label: "Adresse",
                          controller: _adresseController,
                        ),
                        SizedBox(height: 10),
                        InputField(
                          label: "Date de création",
                          controller: _dateCreationController,
                          placeholder: "JJ/MM/AAAA",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () => _addFarm(context),
                        color: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Text(
                          "Ajouter",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String? placeholder;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FermePage(),
  ));
}
