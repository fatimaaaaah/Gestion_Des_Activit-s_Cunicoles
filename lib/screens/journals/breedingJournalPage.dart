import 'package:flutter/material.dart';

class BreedingJournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal de reproduction',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
        
        ),
      ),
      body: const Center(
        child: Text('Contenu du journal de reproduction'),
      ),
    );
  }
}
