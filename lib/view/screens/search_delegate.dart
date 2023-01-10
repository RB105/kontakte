import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/model/model_contacts.dart';
import '../pages/single_pages/info_page.dart';

class MySearchDelegate extends SearchDelegate {
  final Box<ModelContacts> box;

  MySearchDelegate(this.box);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ModelContacts> result = box.values.where((element) {
      return element.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return listViewForSearch(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ModelContacts> suggestions = box.values.where((element) {
      return element.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return listViewForSearch(suggestions);
  }

  ListView listViewForSearch(List<ModelContacts> suggestions) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(data: suggestions[index]),
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
                subtitle: Text(suggestions[index].phone.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                title: Text(
                  suggestions[index].name.toString(),
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
}
