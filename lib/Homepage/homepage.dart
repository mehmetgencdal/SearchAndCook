import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:search_and_cook/Homepage/database.dart';

import 'RecommendedDishesAreaWidget.dart';
import 'SelectedMaterialsAreaWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<dynamic, dynamic>>? values;

  void getValues() async => values = await query();

  @override
  void initState() {
    getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: Colors.white,
        child: Column(children: [
          SafeArea(
            child: Padding(
              // Text widget: What would you like to use?
              padding: const EdgeInsets.only(left: 15, right: 50),
              child: Text(
                "What would you like to use?",
                style:
                    TextStyle(color: Colors.black, fontSize: deviceHeight / 23),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: deviceHeight / 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontStyle: FontStyle.italic),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  suggestionsCallback: (pattern) async {
                    return await values; //
                  },
                  itemBuilder: (context, suggestion) {
                    return const ListTile(
                      leading: Icon(Icons.shopping_cart), //Malzeme ikonu
                      title: Text("Malzeme adı"),
                    );
                  },
                  onSuggestionSelected: (suggestion) {},
                ),
              ),
            ),
          ),
          const SelectedMaterialsArea(),
          const SizedBox(
            height: 10,
          ),
          const RecommendedDishesArea(),
        ]),
      ),
    );
  }
}

Future<String> getFileData(String path) async {
  return await Future(() => "test text");
}

Future<String> getTextFromFile() async {
  return getFileData("test.txt");
}
