import 'package:flutter/material.dart';

import '../../../data/model/model_contacts.dart';

class ChatInfo extends StatefulWidget {
  final ModelContacts data;
  const ChatInfo({super.key, required this.data});

  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: _appBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [ListView(), _bottomBar()],
        ),
      ),
    );
  }

  Align _bottomBar() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        hintText: "Message",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.emoji_emotions)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_library_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                ],
              ),
            ))
          ],
        ));
  }

  AppBar _appBar() {
    return AppBar(
      title: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: const CircleAvatar(
            radius: 22,
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random")),
        title: Text(widget.data.name.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(widget.data.username.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
      centerTitle: true,
    );
  }
}
