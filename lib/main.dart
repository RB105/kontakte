import 'package:flutter/material.dart';
import 'package:kontakte/data/service/contacts_service.dart';
import 'package:kontakte/view/screens/current_screen.dart';

void main(List<String> args) {
  ServiceContacts.registerAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrentScreen(),
    );
  }
}
