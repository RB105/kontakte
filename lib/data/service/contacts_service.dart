import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:kontakte/core/constants/project_urls.dart';
import 'package:kontakte/core/network/dio_config.dart';
import 'package:path_provider/path_provider.dart';

import '../model/model_contacts.dart';

class ServiceContacts {
  static late Box<ModelContacts> userbox;
  Future<dynamic> getContacts() async {
    await openBox();
    try {
      Response response = await Dio().get(UrlsProject.myAPI);
      if (response.statusCode==200) {
        var resdata=(response.data as List).map((e) => ModelContacts.fromJson(e)).toList();
        putToBox(resdata);
        return resdata;
      } else {
        response.statusMessage.toString();
      }
    } on DioError catch (e) {
      if (e.type==DioErrorType.other) {
        return "No Internet Connection";
      } else if(e.type==DioErrorType.connectTimeout) {
        return "Time Out";
      }
    }
  }

  static openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    userbox = await Hive.openBox<ModelContacts>("users");
  }

  static Future putToBox(List<ModelContacts> data) async {
    await userbox.clear();
    for (ModelContacts element in data) {
      await userbox.add(element);
    }
  }
  static registerAdapters(){
    Hive.registerAdapter(ModelContactsAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}
