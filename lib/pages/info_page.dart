import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

import '../data/model/model_contacts.dart';

class InfoPage extends StatefulWidget {
  final ModelContacts data;
  const InfoPage({super.key,required this.data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('info'),),
    );
  }
}