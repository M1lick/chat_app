import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/auth_services.dart';

//{}
class Message {
  String? uid;
  String? content;
  String? senderUID;
  String? receiverUID;
  Timestamp? creatAt;
  Message(
      {this.content, this.creatAt, this.receiverUID, this.senderUID, this.uid});

  Message.fromJson(Map<String, dynamic> json, String id) {
    uid = id;
    content = json['content'];
    senderUID = json['senderUID'];
    receiverUID = json['receiverUID'];
    creatAt = json['creatAt'];
  }
  Map<String, dynamic> tojson() {
    return {
      'content': content,
      'senderUID': senderUID,
      'receiverUID': receiverUID,
      'creatAt': creatAt
    };
  }

  bool get isMe => AuthServices().user.uid == senderUID;
}
