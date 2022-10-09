import 'package:chat_app/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection('users');
  saveUser(Cuser user) async {
    try {
      await userCollection.doc(user.uid).set(user.tojson());
    } catch (e) {}
  }
}
