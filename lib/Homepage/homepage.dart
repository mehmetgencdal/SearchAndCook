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
          Container(
              //Search bar
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
