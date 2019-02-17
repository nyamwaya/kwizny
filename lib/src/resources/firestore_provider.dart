import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

/*
 * This part will be holding our Firebase plugins(Firestore and ML Vision) operations. 
 * For example: logic for storing of notes to the cloud will be written here.
 */
class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> kwizinFeed() {
    return _firestore.collection("kwizin_feed").snapshots();
  }
}
