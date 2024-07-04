
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Conditions dutilisation',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
          centerTitle: true,
      ),
     
      body: Center(
        child: Text('Contenu de la page de friend'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
    home: PrivacyPage(),
  ));
}

