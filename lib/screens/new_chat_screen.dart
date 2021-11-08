import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

import 'package:doctors_app/utils/utils.dart';
import 'package:doctors_app/widgets/widgets.dart';


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
        children: [
          SizedBox(
            height: 81.h,
            child: const ChatListView(),
          ),
          const ChatButtonBar(),
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
          padding: EdgeInsets.only(right: 1.5.h, top: 0.5.h),
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
              SizedBox(
                width: 1.5.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      doctorName,
                      style: GoogleFonts.yantramanav(
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      isOnline == false ? 'Offline' : 'Online',
                      style: GoogleFonts.yantramanav(
                        color: Colors.grey.shade600,
                        fontSize: 12.0.sp,
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
        padding: EdgeInsets.all(1.0.h),
        color: Colors.white,
        height: 8.0.h,
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
            SizedBox(
              width: 1.5.h,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Write message...",
                  hintStyle: GoogleFonts.yantramanav(
                      color: Colors.black54, fontSize: 16.0.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 1.5.h,
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
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: kBoxDecoIndigo,
            height: 12.h,
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
                padding: EdgeInsets.all(2.0.h),
                child: Text(
                  chats[index].message,
                  style: TextStyle(fontSize: 12.0.sp),
                ),
              ),
            ),
          );
        });
  }
}
