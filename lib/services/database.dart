import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class Database {
  Future<void> createJob(Map<String, dynamic> systemData);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  Future<void> createJob(Map<String, dynamic> systemData) async {
    final path = 'users/$uid/systems/systems_abc';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(systemData);
  }
}
