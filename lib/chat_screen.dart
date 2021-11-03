import 'package:flutter/material.dart';
import 'package:hairsaloon/utils/avatar_list.dart';
import 'package:hairsaloon/utils/chat_list.dart';

import 'constants.dart';
import 'home_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoIndigo,
        height: MediaQuery.of(context).size.height * 1.2,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: SearchField(),
              ),
              SizedBox(
                height: 30.0,
              ),
              CircleAvatarChatRow(),
              SizedBox(
                height: 10.0,
              ),
              ChatRow()
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatarChatRow extends StatelessWidget {
  const CircleAvatarChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i in avatars)
          CircleAvatar(
            backgroundImage: i.backgroundImage,
            radius: i.radius,
          )
      ],
    );
  }
}

class ChatRow extends StatelessWidget {
  const ChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                chats[index].doctor,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(chats[index].message),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chats[index].image),
                radius: 35.0,
              ),
              trailing: Text(chats[index].dateTime),
            );
          }),
    );
  }
}
