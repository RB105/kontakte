import 'package:flutter/material.dart';

import 'package:kontakte/data/service/contacts_service.dart';
import 'package:kontakte/screens/drawer.dart';

import 'info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Kontakte"),
        centerTitle: true,
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: ServiceContacts().getContacts(),
        builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return  Center(child:  Image.asset("assets/loading.gif"));
        }else {
         return ListView.builder(
                          itemCount: ServiceContacts.userbox.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InfoPage(
                                          data: ServiceContacts.userbox
                                              .getAt(index)!),
                                    ));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  leading: Container(
                                    height: 60,
                                    width: 60,
                                    decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                          image: DecorationImage(
                                        image: NetworkImage(
                                            "https://source.unsplash.com/random/$index"),
                                        fit: BoxFit.cover),
                                        color: Colors.transparent,
                                        boxShadow: const [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.25),
                                              offset: Offset(0, 2),
                                              blurRadius: 9)
                                        ]),
                                  ),
                                  subtitle: Text(
                                      ServiceContacts.userbox
                                          .getAt(index)!
                                          .phone
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  title: Text(
                                    ServiceContacts.userbox
                                        .getAt(index)!
                                        .name
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {}, icon: const Icon(Icons.call)),
                                ),
                              ),
                            );
                          },
                        );;
        }
      },),
    );
  }
}
