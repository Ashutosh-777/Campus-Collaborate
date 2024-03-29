import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../screens/splash_screen.dart';
import '../models/message.dart';
import '../providers/database_provider.dart';
import 'chat_splash_screen.dart';

class GroupMessageScreen extends StatefulWidget {
  final String groupId;
  final String team;

  GroupMessageScreen({required this.groupId, required this.team});

  @override
  _GroupMessageScreen createState() => _GroupMessageScreen();
}

class _GroupMessageScreen extends State<GroupMessageScreen> {
  late final Stream<QuerySnapshot> _messageStream;
  late final String teamName;

  @override
  void initState() {
    super.initState();
    teamName = widget.team;
    _messageStream = FirebaseFirestore.instance
        .collection('GroupConversations')
        .doc(widget.groupId)
        .collection('messages')
        .orderBy('timeSent', descending: false)
        .snapshots();
  }

  DatabaseProvider databaseProvider = DatabaseProvider();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person), // You can use any icon you prefer
            ),
            SizedBox(
              width: 10,
            ),
            Text(teamName),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color.fromRGBO(224, 140, 56, 1),
            ),
            onPressed: () {
              // Handle the action when the three dots icon is pressed
              print('Three dots icon pressed');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _messageStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen1();
                  }
                  return ListView(
                    reverse: false,
                    shrinkWrap: true,
                    controller: scrollController, // Add this line
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      bool isCurrentUser = data['senderId'] == "user1";
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Material(
                          color: Color.fromRGBO(85, 85, 85, 1),
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: isCurrentUser
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['message'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Material(
                    color: Color.fromRGBO(85, 85, 85, 1),
                    child: TextField(
                      controller: textController,
                      autofocus: true,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      // Handle the picked image, you can send it or perform other actions
                      print("Image path: ${pickedFile.path}");
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 161, 93, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.attachment_sharp,
                      color: Color.fromRGBO(214, 140, 56, 1),
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    String groupId = widget.groupId;
                    bool isGroup = true;
                    Message message = Message(
                        message: textController.text,
                        timeSent: DateTime.timestamp(),
                        senderId: "user1");
                    textController.clear();
                    await databaseProvider.sendMessage(
                        groupId, isGroup, message);
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 100),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 161, 93, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
