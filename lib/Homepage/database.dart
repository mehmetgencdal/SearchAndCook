import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> database() async {
  ByteData data = await rootBundle.load("db/database.db");
  List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  final directory = await getDatabasesPath();
  String dbPath = join(directory, "database.db");
  await File(dbPath).writeAsBytes(bytes);

  var db = await openDatabase(dbPath);
  return db;
}

query() async {
  // get a reference to the database
  Database db = await database();

  // get all rows
  List<Map> result = await db.query("ingredients");

  return result;
}

query2() async {
  // get a reference to the database
  Database db = await database();

  // get all rows
  List<Map> result = await db.query("ingredients");
  List ingName = [];
  var i = result.length;
  var j = 0;
  while (j < i) {
    ingName.add(result[j]["ingName"]);
    j++;
  }

  return ingName;
}

query3() async {
  // get a reference to the database
  Database db = await database();

  // get all rows
  List<Map> result = await db.query("ingredients");
  var ingInf = {};
  var i = result.length;
  var j = 0;
  while (j < i) {
    ingInf[result[j]["ingName"]] = result[j]["ingIcon"];
    j++;
  }

  return ingInf;
}
