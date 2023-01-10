import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar()
    );
  }

  AppBar _appBar() {
    return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title:  const Text(
      "Kontakte",
      style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: "Lobster"),
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black, size: 30),
  );
  }
}