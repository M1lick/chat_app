import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection('Users');
  var msgCollection = FirebaseFirestore.instance.collection('Users');
  saveUser(Cuser user) async {
    try {
      await userCollection.doc(user.uid).set(user.tojson());
    } catch (e) {}
  }

  Stream<List<Cuser>> get getDiscussionUser {
    return userCollection
        .where("uid", isNotEqualTo: AuthServices().user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Cuser.fromJson(e.data())).toList());
  }

  Stream<List<Message>> getMessage(String receiverUID,
      [bool myMessage = true]) {
    return msgCollection
        .where('senderUID',
            isEqualTo: myMessage ? AuthServices().user.uid : receiverUID)
        .where('receiverUID',
            isEqualTo: myMessage ? receiverUID : AuthServices().user.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Message.fromJson(e.data(), e.id)).toList());
  }

  Future<bool> sendMessage(Message msg) async {
    try {
      await msgCollection.doc().set(msg.tojson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
