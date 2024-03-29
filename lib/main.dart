import 'package:flutter/material.dart';
import 'package:search_and_cook/Homepage/homepage.dart';

Future<void> main() async {
  runApp(const SearchAndCookApp());
}

class SearchAndCookApp extends StatelessWidget {
  const SearchAndCookApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search and Cook',
      theme: ThemeData(primaryColor: Colors.orange[100]),
      home: const HomePage(),
    );
  }
}
