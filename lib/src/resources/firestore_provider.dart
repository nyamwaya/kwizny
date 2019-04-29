import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

/*
 * This part will be holding our Firebase plugins(Firestore and ML Vision) operations. 
 * For example: logic for storing of notes to the cloud will be written here.
 */
class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  //this gets the "news feed"
  Stream<QuerySnapshot> kwizinFeed() {
    return _firestore.collection("kwizin_feed").snapshots();
  }

  //Create a user profile and update the name photo etc
  Future createUserProfile(String name, String email, String userID) async{
    await _firestore.collection('users').document(userID).setData({'userName': '$name', 'email': '$email','userId': '$userID'}, merge: true);
  }

  //a user liked or disliked a photo, update the server
  // Future<dynamic> userLikedPhoto(String like, String documentID) async{
  //   final TransactionHandler updateTransaction = (Transaction tx) async {
  //     final DocumentSnapshot kwizinLiked = await tx.get(_firestore.collection('users').document(documentID));
    
  //     await tx.update(kwizinLiked.reference, _toMap(like));
  //     return {'likes': true};

    
  //   };

  //   return _firestore.runTransaction(updateTransaction).then((r)=> r['likes']).catchError((e){
  //     print('dirt error: $e');
  //   });
  // }
}
