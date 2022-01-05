import 'package:flutter/material.dart';

import 'RecommendedDishesAreaWidget.dart';
import 'SelectedMaterialsAreaWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            //Search bar
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: deviceHeight / 20,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      hintText: "Search Ingredient"),
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

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': 100};
    });
  }
}
