import 'package:flutter/material.dart';

// Model class representing a litter of rabbits
class Litter {
  final DateTime date;
  late final int quantity; // Number of offspring
  late final String notes; // Notes about the litter

  Litter({
    required this.date,
    required this.quantity,
    required this.notes,
  });
}

// Model class representing a female rabbit with its litters
class ReproductionRabbit {
  final String name; // Name of the rabbit
  final List<Litter> litters; // List of litters for the rabbit

  ReproductionRabbit({
    required this.name,
    required this.litters,
  });
}
