import 'package:flutter/material.dart';
import 'package:kontakte/core/constants/current_them_mode.dart';
import 'package:kontakte/view/pages/single_pages/chat_info.dart';
import 'package:kontakte/view/screens/drawer.dart';

import '../../../data/service/contacts_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CurrentThemMode.scaffoldColor,
      drawer: const NavDrawer(),
      appBar: _appBar(context),
      body: _builder()
    );
  }

  Builder _builder() {
    return Builder(builder: (context) {
      if (ServiceContacts.userbox!.isEmpty) {
        return Center(child: Image.asset("assets/loading.gif"));
      } else {
        return ListView.builder(
          itemCount: ServiceContacts.userbox!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatInfo(
                          data: ServiceContacts.userbox!.getAt(index)!),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://source.unsplash.com/random/$index"),
                              fit: BoxFit.cover),
                          color: Colors.transparent,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 2),
                                blurRadius: 9)
                          ]),
                    ),
                    subtitle: Text(
                        ServiceContacts.userbox!
                            .getAt(index)!
                            .phone
                            .toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    title: Text(
                      ServiceContacts.userbox!.getAt(index)!.name.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: const Icon(Icons.done_all_rounded)),
              ),
            );
          },
        );
      }
    },);
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: const Text(
        "Chat",
        style: TextStyle(
            fontFamily: 'Lobster', color: Colors.black, fontSize: 25),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // showSearch(
            //     context: context,
            //     delegate: ChatSearchDelegate(ServiceContacts.userbox!));
          },
          icon: const Icon(Icons.search),
        )
      ],
      iconTheme: const IconThemeData(color: Colors.black,size: 28),
    );
  }
}
