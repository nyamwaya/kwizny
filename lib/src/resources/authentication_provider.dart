import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

/**
 * This page is responsible for ecommunicating with the firebase auth service
 * it helps us with login/logout and registering an authenticated user
 * 
 * It is supposed to also be used when chanign the password & auth details. 
 * but that isin't working right now. Look into it when you cross that bridge. 
 */

class AuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return user.uid;
  }

  Future<String> currentuser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  // The problem here is that the updateProfile method is not recognized
  // Look into this issue when you do the edit profile / change password
  // Future<String> updateProfileChangeRequest(String firstName) async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   if (user != null) {
  //     UserUpdateInfo userInfo = new UserUpdateInfo();
  //     userInfo.displayName = firstName;
  //     _firebaseAuth.updateProfile(userInfo);
  //     await user.reload();

  //     return user.displayName;
  //   }

  //   return "user was null";
  // }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
