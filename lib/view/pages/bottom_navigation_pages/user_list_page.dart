import 'package:flutter/material.dart';
import 'package:kontakte/core/constants/current_them_mode.dart';

import 'package:kontakte/data/service/contacts_service.dart';
import 'package:kontakte/view/screens/drawer.dart';
import 'package:kontakte/view/screens/search_delegate.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider_theme_change.dart';
import '../single_pages/info_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _HomePageState();
}

class _HomePageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeThemeProvider()),
      ],
      builder: (context, child) {
        return Scaffold(
          backgroundColor: CurrentThemMode.scaffoldColor,
          resizeToAvoidBottomInset: false,
          appBar: myAppBar(),
          drawer: const NavDrawer(), // drawer
          body: bodyBuilder(),
        );
      },
    );
  }

// App bar edition
// Search Delegate within this
  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Kontakte",
        style:
            TextStyle(fontSize: 25, color: Colors.black, fontFamily: "Lobster"),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: MySearchDelegate(ServiceContacts.userbox));
            },
            icon: const Icon(Icons.search_outlined))
      ],
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
    );
  }

// HOME PAGE body
  Widget bodyBuilder() {
    return Builder(builder: (context) {
        if (ServiceContacts.userbox.isEmpty) {
          return Center(child: Image.asset("assets/loading.gif"));
        } else {
          return ListView.builder(
            itemCount: ServiceContacts.userbox.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                            data: ServiceContacts.userbox.getAt(index)!),
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
                          ServiceContacts.userbox
                              .getAt(index)!
                              .phone
                              .toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      title: Text(
                        ServiceContacts.userbox.getAt(index)!.name.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: SizedBox(
                        height: 25,
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.call)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.messenger_sharp)),
                          ],
                        ),
                      )),
                ),
              );
            },
          );
        }
      },);
  }
}
