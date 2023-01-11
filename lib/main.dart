import 'package:flutter/material.dart';
import 'package:kontakte/data/service/contacts_service.dart';
import 'package:kontakte/provider/prvovider_info_page.dart';
import 'package:kontakte/view/screens/current_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  
  ServiceContacts.registerAdapters();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProviderInfoPage(),
      )
    ],
    child: const MyApp(),
  ));
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
