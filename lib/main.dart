import 'package:flutter/material.dart';
import 'app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'my_database.db');
  final database = await openDatabase(
    path,
    version: 1
  );
  return database;
}

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  final database = await openMyDatabase();
  runApp(const MyApp());
}