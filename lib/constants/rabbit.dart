import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// lib/constants/rabbit.dart

class Rabbit {
  String name;
  int age;
  double weight;
  String gender;
  String? imagePath; // Champ imagePath pour stocker le chemin de l'image
   File? image; // Champ pour l'image du lapin
  String? color; // Couleur du lapin
  String? origin; // Origine du lapin
  DateTime? dateAdded; // Date d'ajout du lapin

  Rabbit({
    required this.name,
    required this.age,
    required this.weight,
    required this.gender,
    this.imagePath, // Ce champ est facultatif
      this.image,
    this.color,
    this.origin,
    this.dateAdded,
  });

  static fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}

