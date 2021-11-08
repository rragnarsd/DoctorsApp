import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:doctors_app/utils/utils.dart';
import 'package:doctors_app/widgets/widgets.dart';

import 'new_chat_screen.dart';

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
                height: 60.0,
              ),
              CircleAvatarChatRow(),
              SizedBox(
                height: 20.0,
              ),
              ChatRow(),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 15.0, left: 15.0),
            child: ChatStory(),
          ),
          Row(
            children: List.generate(chats.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 60.0,
                      height: 60.0,
                      child: Stack(
                        children: [
                          chats[index].hasStory
                              ? ChatContainer(index: index)
                              : CachedImage(
                                  doctorImage: chats[index].image,
                                  height: 70.0,
                                  width: 70.0,
                                ),
                          chats[index].isOnline
                              ? const ChatPositioned()
                              : Container()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 75.0,
                      child: Align(
                          child: Text(
                        chats[index].doctor,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class ChatStory extends StatelessWidget {
  const ChatStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
          child: const Center(
            child: Icon(UniconsLine.plus,
                size: 30.0, color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 75.0,
          child: Align(
            child: Text(
              'Story',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}

class ChatPositioned extends StatelessWidget {
  const ChatPositioned({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40.0,
        left: 42.0,
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: const Color(0xff0E7723),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
      );
  }
}

class ChatContainer extends StatelessWidget {
  final int index;
  const ChatContainer({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xff1651DA),
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CachedImage(
            doctorImage: chats[index].image,
            height: 75.0,
            width: 75.0,
          ),
        ),
      );
  }
}

class ChatRow extends StatelessWidget {
  const ChatRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(chats.length, (index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 5.0,
              top: 5.0,
              bottom: 5.0,
            ),
            child: Row(children: [
              SizedBox(
                width: 70.0,
                height: 60.0,
                child: Stack(
                  children: [
                    chats[index].hasStory
                        ? ChatContainer(index: index)
                        : CachedImage(
                            doctorImage: chats[index].image,
                            height: 70.0,
                            width: 70.0,
                          ),
                    chats[index].isOnline
                        ? const ChatPositioned()
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ListTile(
                  title: Text(
                    chats[index].doctor,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    chats[index].message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black38),
                  ),
                  trailing: Text(
                    chats[index].dateTime,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black38,
                          fontSize: 14.0,
                        ),
                  ),
                ),
              )
            ]),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewChatScreen(
                doctorName: chats[index].doctor,
                doctorImage: chats[index].image,
                isOnline: chats[index].isOnline,
              ),
              settings: RouteSettings(arguments: chats[index]),
            ),
          ),
        );
      }),
    );
  }
}
