import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetlicence/constants/rabbit.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addRabbit(Rabbit rabbit) async {
    try {
      await _db.collection('rabbits').add({
        'name': rabbit.name,
        'age': rabbit.age,
        'weight': rabbit.weight,
        'gender': rabbit.gender,
        'imagePath': rabbit.imagePath,
        'color': rabbit.color,
        'origin': rabbit.origin,
        'dateAdded': rabbit.dateAdded ?? DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateRabbit(String id, Rabbit rabbit) async {
    try {
      await _db.collection('rabbits').doc(id).update({
        'name': rabbit.name,
        'age': rabbit.age,
        'weight': rabbit.weight,
        'gender': rabbit.gender,
        'imagePath': rabbit.imagePath,
        'color': rabbit.color,
        'origin': rabbit.origin,
        'dateAdded': rabbit.dateAdded,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRabbit(String id) async {
    try {
      await _db.collection('rabbits').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Rabbit>> getRabbits() {
    return _db.collection('rabbits').snapshots().map((snapshot) =>
      snapshot.docs.map<Rabbit>((doc) => Rabbit.fromFirestore(doc)).toList()
    );
  }
}
