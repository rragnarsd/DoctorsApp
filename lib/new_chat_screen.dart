import 'package:doctors_app/utils/chat_list.dart';
import 'package:doctors_app/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import 'constants.dart';

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
          decoration: kBoxDecoIndigo,
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
              CachedImage(
                doctorImage: doctorImage,
                height: 40.0,
                width: 40.0,
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
                      style:  GoogleFonts.yantramanav(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      isOnline == false ? 'Offline' : 'Online',
                      style:  GoogleFonts.yantramanav(
                        color: Colors.grey.shade600,
                        fontSize: 16.0,
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
        color: Colors.white,
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                UniconsLine.paperclip,
                color: Colors.grey.shade400,
                size: 30.0,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Write message...",
                  hintStyle: GoogleFonts.yantramanav(
                      color: Colors.black54, fontSize: 20.0),
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
                UniconsLine.message,
                color: Colors.white,
                size: 20,
              ),
              backgroundColor: const Color(0xff1651DA),
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
            decoration: kBoxDecoIndigo,
            height: MediaQuery.of(context).size.height / 8.8,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
              bottom: 15.0,
            ),
            child: Align(
              alignment: (chats[index].messageType == 'receiver'
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (chats[index].messageType == 'receiver'
                      ? Colors.white.withOpacity(0.5)
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
