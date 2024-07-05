import 'package:flutter/material.dart';

// Classe représentant une portée de lapins
class Portee {
  final DateTime date;
  late final int quantity; // Quantité de lapereaux
  late final String notes; // Notes sur la portée

  Portee({
    required this.date,
    required this.quantity,
    required this.notes,
  });
}

// Classe représentant une lapine
class FemaleRabbit {
  final String name; // Nom de la lapine
  final DateTime birthDate; // Date de naissance de la lapine
  final List<Portee> portees; // Liste des portées de la lapine

  FemaleRabbit({
    required this.name,
    required this.birthDate,
    required this.portees,
  });
}

// Liste simulée de lapines avec leurs portées
List<FemaleRabbit> femellesList = [
  FemaleRabbit(
    name: 'Lucy',
    birthDate: DateTime(2020, 5, 15),
    portees: [
      Portee(date: DateTime(2021, 1, 10), quantity: 5, notes: 'Première portée'),
    ],
  ),
  FemaleRabbit(
    name: 'Charlotte',
    birthDate: DateTime(2019, 8, 20),
    portees: [
      Portee(date: DateTime(2020, 3, 25), quantity: 4, notes: 'Deuxième portée'),
      Portee(date: DateTime(2021, 2, 15), quantity: 3, notes: 'Troisième portée'),
      
    ],
  ),
  FemaleRabbit(
    name: 'Eva',
    birthDate: DateTime(2020, 5, 15),
    portees: [
      Portee(date: DateTime(2021, 1, 10), quantity: 5, notes: 'Quatriéme portée'),
    ],
  ),
  FemaleRabbit(
    name: 'Aicha',
    birthDate: DateTime(2020, 5, 15),
    portees: [
      Portee(date: DateTime(2021, 1, 10), quantity: 5, notes: 'Cinquiéme portée'),
    ],
  ),
  FemaleRabbit(
    name: 'Zoé',
    birthDate: DateTime(2020, 5, 15),
    portees: [
      Portee(date: DateTime(2021, 1, 10), quantity: 5, notes: 'Sixiéme portée'),
    ],
  ),
  FemaleRabbit(
    name: 'nguénar',
    birthDate: DateTime(2020, 5, 15),
    portees: [
      Portee(date: DateTime(2021, 1, 10), quantity: 5, notes: 'Septiéme portée'),
    ],
  ),
];
