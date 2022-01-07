import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:search_and_cook/Homepage/database.dart';

import 'RecommendedDishesAreaWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<dynamic, dynamic>>? values;
  Map<dynamic, dynamic>? icons;
  List<String> selected = [];
  Map<dynamic, dynamic>? dishes;
  List dishNames = [];

  void getValues() async {
    values = await query();
    icons = await query3();
    dishes = await query2();
    dishNames = (dishes?.keys.toList())!;
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
                  borderRadius: BorderRadius.circular(30.0),
                ),
                height: deviceHeight / 23,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TypeAheadField(
                      textFieldConfiguration: const TextFieldConfiguration(
                        style: TextStyle(fontSize: 15.0),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Ingredient",
                            icon: Icon(
                              Icons.search,
                              color: Colors.orange,
                            )),
                      ),
                      suggestionsCallback: (pattern) {
                        List<String> ing = [];
                        var i = values?.length;
                        var j = 0;
                        while (j < i!) {
                          ing.add(values![j]["ingName"]);
                          j++;
                        }
                        List<String> matches = [];
                        matches.addAll(ing);

                        matches.retainWhere((s) =>
                            s.toLowerCase().contains(pattern.toLowerCase()));
                        return matches;
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          leading: Image.network(
                            icons![suggestion.toString()],
                            width: 30.0,
                            height: 30.0,
                          ), //Malzeme ikonu
                          title: Text(suggestion.toString()),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        selected.add(suggestion.toString());
                        selected = selected.toSet().toList();
                        var counter = 0;
                        var secondCounter = selected.length - 1;

                        while (counter < dishNames.length) {
                          if (dishes![dishNames[counter]]
                                  .toString()
                                  .contains(selected[secondCounter]) !=
                              true) {
                            dishNames.remove(dishNames[counter]);
                          }
                          counter++;
                        }
                      }),
                ),
              ),
            );
          }),
          Column(children: [
            Align(
              // Text widget Selected Materials
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                child: Text(
                  "Selected Materials",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 10.0,
              // Selected Materials area
              child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width - 30.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 5.0),
                    itemCount: selected.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 15.0, right: 15.0, bottom: 10.0),
                        child: Stack(children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      child: Image.network(
                                        icons![selected[index]],
                                      ),
                                    ),
                                    Text(
                                      selected[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          print(dishNames);
                                          selected.remove(selected[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        ]),
                      );
                    },
                  )),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          const RecommendedDishesArea(),
        ]),
      ),
    );
  }
}
