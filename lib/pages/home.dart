import 'package:chat_app/config/function.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/pages/chat.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('${AuthServices().user.email}'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthServices().signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<List<Cuser>>(
        stream: DBServices().getDiscussionUser,
        builder: (_, s) {
          if (s.hasData) {
            final users = s.data;
            return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (ctx, i) {
                  final user = users[i];
                  return users.length == 0
                      ? const Center(
                          child: Text("Aucune discution"),
                        )
                      : ListTile(
                          onTap: (() {
                            NavigateToNextPage(context, ChatPage(user: user));
                          }),
                          leading: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(.5)),
                            child: const Icon(Icons.person),
                          ),
                          title: Text(user.name!),
                          subtitle: Text(user.email!),
                        );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
