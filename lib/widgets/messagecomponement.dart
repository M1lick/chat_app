import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({Key? key, this.msg}) : super(key: key);
  final Message? msg;
  @override
  Widget build(BuildContext context) {
    var date = msg!.creatAt!.toDate().toLocal();
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment:
          msg!.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: msg!.isMe ? Colors.blue : Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: msg!.isMe
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                    bottomRight: msg!.isMe
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                  )),
              constraints: BoxConstraints(
                  minHeight: 50, minWidth: 70, maxHeight: width / 1.1),
              child: Text(
                msg!.content!,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.only(right: 5, bottom: 1),
                    child: Text(
                      '${date.hour}h${date.minute}',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    )))
          ],
        )
      ],
    );
  }
}
