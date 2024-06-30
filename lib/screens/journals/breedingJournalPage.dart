import 'package:flutter/material.dart';

class BreedingJournalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Journal de reproduction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Section: Liste des reproducteurs
            _buildSectionTitle('Liste des reproducteurs'),
            _buildBreedingList(),

            // Section: Historique des accouplements
            _buildSectionTitle('Historique des accouplements'),
            _buildMatingHistory(),

            // Section: Suivi des gestations
            _buildSectionTitle('Suivi des gestations'),
            _buildGestationTracking(),

            // Section: Récapitulatif des naissances
            _buildSectionTitle('Récapitulatif des naissances'),
            _buildBirthSummary(),

            // Section: Observations et notes
            _buildSectionTitle('Observations et notes'),
            _buildNotes(),

            // Section: Statistiques de reproduction
            _buildSectionTitle('Statistiques de reproduction'),
            _buildReproductionStatistics(),

            // Section: Rappels et calendrier
            _buildSectionTitle('Rappels et calendrier'),
            _buildRemindersCalendar(),

            // Section: Conseils et bonnes pratiques
            _buildSectionTitle('Conseils et bonnes pratiques'),
            _buildTips(),
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

  Widget _buildBreedingList() {
    // Placeholder for breeding list widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Liste des lapines et des lapins reproducteurs'),
    );
  }

  Widget _buildMatingHistory() {
    // Placeholder for mating history widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Historique des accouplements'),
    );
  }

  Widget _buildGestationTracking() {
    // Placeholder for gestation tracking widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Suivi des gestations'),
    );
  }

  Widget _buildBirthSummary() {
    // Placeholder for birth summary widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Récapitulatif des naissances'),
    );
  }

  Widget _buildNotes() {
    // Placeholder for notes widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Observations et notes'),
    );
  }

  Widget _buildReproductionStatistics() {
    // Placeholder for reproduction statistics widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Statistiques de reproduction'),
    );
  }

  Widget _buildRemindersCalendar() {
    // Placeholder for reminders calendar widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Rappels et calendrier'),
    );
  }

  Widget _buildTips() {
    // Placeholder for tips widget
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('Conseils et bonnes pratiques'),
    );
  }
}
