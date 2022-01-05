import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final String dishName;
  final String dishRecipe;
  final String dishPicUrl;
  const RecipePage(
      {Key? key,
      required this.dishName,
      required this.dishRecipe,
      required this.dishPicUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Search & Cook Recipe",
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height / 30),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                iconSize: MediaQuery.of(context).size.height / 30,
                color: Colors.black,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: MediaQuery.of(context).size.height / 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Material(
                  elevation: 10.0,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  child: Stack(children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 2 * MediaQuery.of(context).size.height / 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          dishName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height / 25,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      elevation: 10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(dishPicUrl),
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                elevation: 10.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 25.0, bottom: 25.0),
                    child: Text(
                      dishRecipe,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
