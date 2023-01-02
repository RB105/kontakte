import 'dart:io';

import 'package:hive/hive.dart';
import 'package:kontakte/data/service/contacts_service.dart';
import 'package:path_provider/path_provider.dart';

import '../data/model/model_contacts.dart';

class RepositoryContacts {
  static late Box<ModelContacts> userbox;
  ServiceContacts service = ServiceContacts();
  Future getRepositoryContacts() async {
    return await service.getContacts().then((response) async {
      if (response is List<ModelContacts>) {
        registerAdapters();
        await openBox();
        await putToBox(response);
      } else {
        return response;
      }
    });
  }

  static openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    userbox = await Hive.openBox<ModelContacts>("users");
  }

  static putToBox(List<ModelContacts> data) async {
    await userbox.clear();
    for (ModelContacts element in data) {
      await userbox.add(element);
    }
  }

  static registerAdapters() {
    Hive.registerAdapter(ModelContactsAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}
