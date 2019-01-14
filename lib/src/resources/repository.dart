import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kwizny/src/resources/authentication_provider.dart';
import 'firestore_provider.dart';

/*
 * The Repository pattern is used to decouple the business logic
 * and the data access layers in our application. 
 * 
 * 
 * It will expose all the Data layer operations to the BLoC layer.
 * for example, the firebase authentication and firestore calls 
 */

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _authenticationProvider = AuthenticationProvider();

  /// Authentication calls
  Future<String> signInWithEmailAndPasswordilAndPassword(
          String email, String password) async =>
      _authenticationProvider.signInWithEmailAndPassword(email, password);

  Future<String> createUserWithEmailAndPassword(
          String email, String password) async =>
      _authenticationProvider.createUserWithEmailAndPassword(email, password);

  Future<String> currentuser() async => _authenticationProvider.currentuser();

  /// firestore calls
  Future<void> uploadGoal(String email, String title, String goal) =>
      _firestoreProvider.uploadGoal(title, email, goal);

  Stream<DocumentSnapshot> myGoalList(String email) =>
      _firestoreProvider.myGoalList(email);

  Stream<QuerySnapshot> othersGoalList() => _firestoreProvider.othersGoalList();

  void removeGoal(String title, email) =>
      _firestoreProvider.removeGoal(title, email);

  // Future<int> authenticateUser(String email, String password) =>
  //     _firestoreProvider.authenticateUser(email, password);

  // Future<void> registerUser(String email, String password) =>
  //     _firestoreProvider.registerUser(email, password);
}
