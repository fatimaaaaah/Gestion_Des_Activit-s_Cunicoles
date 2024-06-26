import 'package:flutter/material.dart';

class SimpleDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord comptable'),
      ),
      body: Center(
        child: Text('Contenu du tableau de bord comptable'),
      ),
    );
  }
}
