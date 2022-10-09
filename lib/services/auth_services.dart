import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> singnIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      print(e.toString());
      return false;
    }
  }

  singnUp(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DBServices()
          .saveUser(Cuser(uid: user.uid, email: user.email, name: name));
      return true;
    } on FirebaseException catch (e) {
      print(e.toString());
      return false;
    }
  }

  User get user => FirebaseAuth.instance.currentUser!;
  //methode pour voir si on connecter
  Stream<User?> get onchangedUser => _auth.authStateChanges();
  // methode pour deconecter
  signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {}
  }
}
