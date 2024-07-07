import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour obtenir l'ID de l'utilisateur actuellement connecté
  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  // Méthode pour ajouter une ferme et mettre à jour les collections "farms" et "users"
  Future<void> addFarm({
    required String farmName,
    required String address,
    required DateTime creationDate,
    required String uid,
  }) async {
    String? userId = getCurrentUserId();
    if (userId == null) {
      throw Exception('Utilisateur non connecté');
    }

    DocumentReference farmRef = await _firestore.collection('farms').add({
      'farmName': farmName,
      'address': address,
      'creationDate': creationDate,
      'userId': userId,
    });

    await _firestore.collection('users').doc(userId).update({
      'ferme': FieldValue.arrayUnion([farmRef.id]),
    });
  }
}
