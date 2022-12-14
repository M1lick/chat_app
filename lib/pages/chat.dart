import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/db_services.dart';
import 'package:chat_app/widgets/messagecomponement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key, this.user}) : super(key: key);
  final Cuser? user;
  var msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user!.name!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<List<Message>>(
              stream: DBServices().getMessage(user!.uid!),
              builder: (context, s1) {
                if (s1.hasData) {
                  return StreamBuilder<List<Message>>(
                    stream: DBServices().getMessage(user!.uid!, false),
                    builder: (context, s2) {
                      if (s2.hasData) {
                        var messages = [...s1.data!, ...s2.data!];
                        messages
                            .sort((i, j) => i.creatAt!.compareTo(j.creatAt!));
                        messages = messages.reversed.toList();

                        return messages.isEmpty
                            ? const Center(
                                child: Text("aucune message"),
                              )
                            : ListView.builder(
                                reverse: true,
                                itemCount: messages.length,
                                itemBuilder: (content, index) {
                                  final msg = messages[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: MessageComponent(
                                      msg: msg,
                                    ),
                                  );
                                },
                              );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: msgController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var msg = Message(
                        content: msgController.text,
                        creatAt: Timestamp.now(),
                        receiverUID: user!.uid,
                        senderUID: AuthServices().user.uid);
                    msgController.clear();
                    await DBServices().sendMessage(msg);
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
