import 'package:flutter/material.dart';
import 'package:hairsaloon/utils/chat_list.dart';

class NewChatScreen extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final bool isOnline;
  const NewChatScreen(
      {Key? key,
      required this.doctorName,
      required this.doctorImage,
      required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: const [
          ChatListView(),
          ChatButtonBar(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 15.0, top: 5.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(doctorImage),
                maxRadius: 20,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      isOnline == false ? 'Offline' : 'Online',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatButtonBar extends StatelessWidget {
  const ChatButtonBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write message...",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: (chats[index].messageType == 'receiver'
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: (chats[index].messageType == 'receiver'
                      ? Colors.grey.shade200
                      : Colors.blue.shade200),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  chats[index].message,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        });
  }
}
