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
  List ingNames = [];

  //void getValues() async => values = await query();
  void getValues() async {
    values = await query();
  }

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
          Builder(builder: (context) {
            if (values == null) {
              return const CircularProgressIndicator();
            }
            return Padding(
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
                    textFieldConfiguration: const TextFieldConfiguration(
                      decoration: InputDecoration(
                          hintText: "Search Ingredient",
                          icon: Icon(Icons.search)),
                    ),
                    suggestionsCallback: (pattern) async {
                      List ing = [];
                      var i = values?.length;
                      var j = 0;
                      /*while (j < i!) {
                        ing.add(values![j]["ingName"]);
                        j++;
                      }*/

                      return ing; //
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Image.network(
                          values![0]["ingIcon"],
                          width: 30.0,
                          height: 30.0,
                        ), //Malzeme ikonu
                        title: Text(values![0]["ingName"]),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      List ing = [];
                      var i = values?.length;
                      var j = 0;
                      while (j < i!) {
                        ing.add(values![j]["ingName"]);
                        j++;
                      }
                      print(ing);
                    },
                  ),
                ),
              ),
            );
          }),
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
