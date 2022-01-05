import 'package:flutter/material.dart';

class SelectedMaterialsArea extends StatelessWidget {
  const SelectedMaterialsArea({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        // Text widget Selected Materials
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 8.0),
          child: Text(
            "Selected Materials",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40),
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
            child: ListView(
              padding: const EdgeInsets.only(top: 5.0),
              children: const [
                SelectedIngCard(
                  ingImageUrl:
                      "https://cdn.pixabay.com/photo/2012/04/18/14/37/tomato-37219_960_720.png",
                  ingName: "Domates",
                )
              ],
            )),
      ),
    ]);
  }
}

class SelectedIngCard extends StatelessWidget {
  final String ingImageUrl;
  final String ingName;
  const SelectedIngCard(
      {Key? key, required final this.ingImageUrl, required final this.ingName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 20,
                    height: MediaQuery.of(context).size.width / 10,
                    child: Image.network(
                      ingImageUrl,
                    ),
                  ),
                  Text(
                    ingName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 50),
                  ),
                  Row(children: const [
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                    )
                  ])
                ]),
          ),
        )
      ]),
    );
  }
}
