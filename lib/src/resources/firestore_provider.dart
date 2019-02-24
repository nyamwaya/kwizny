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

  // Future<String> createUserProfile(String name, String email) async{
  //   DocumentReference ref = await _firestore.collection('users').add({'userName': '$name', 'email': '$email'});
  //   return ref.documentID;
  // }

  Future createUserProfile(String name, String email, String userID) async{
    await _firestore.collection('users').document(userID).setData({'userName': '$name', 'email': '$email','userId': '$userID'}, merge: true);
  }
}
