import 'package:flutter/material.dart';
import 'package:kontakte/provider/prvovider_info_page.dart';
import 'package:provider/provider.dart';

import '../../../data/model/model_contacts.dart';

class InfoPage extends StatefulWidget {
  final ModelContacts data;
  const InfoPage({super.key, required this.data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProviderInfoPage(),
        builder: (context, child) => _scaffold(),
      )
    ]);
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: _appBar(),
      body: _centeralContainer(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Kontakte",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            final snackbar = SnackBar(
              content: Text("${widget.data.name.toString()} has been blocked"),
              backgroundColor: Colors.black45,
              action: SnackBarAction(
                label: 'dismiss',textColor: Colors.black,
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Block",
                child: Text(
                  "Block",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ];
          },
        )
      ],
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
    );
  }

  Widget _centeralContainer() {
    return Opacity(
      opacity: Provider.of<ProviderInfoPage>(context).pageOpacity,
      child: Center(
        child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 309,
                width: 337,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          offset: Offset(0, 0),
                          color: Colors.black38)
                    ]),
                child: inSideText(),
              ),
              Positioned(bottom: 230, child: myProfilPicture()),
            ]),
      ),
    );
  }

  Column inSideText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          widget.data.name.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        Text(
          widget.data.company!.name.toString(),
          style: const TextStyle(
              fontSize: 14,
              color: Color(0xffA2A9B7),
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            Text(
              widget.data.phone.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff36383D),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
            Text(
              widget.data.email.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff36383D),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: const StadiumBorder()),
              child: const Text(
                "Call",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: const StadiumBorder()),
              child: const Text(
                "News",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          ],
        )
      ],
    );
  }

  Container myProfilPicture() {
    return Container(
      height: 183,
      width: 183,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://source.unsplash.com/random'),
              fit: BoxFit.cover),
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color(0xffC4C4C4), blurRadius: 9, offset: Offset(0, 2))
          ]),
    );
  }
}
