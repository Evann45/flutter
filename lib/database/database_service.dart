import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  static Future<String> get fullPath async {
    const name = 'nombre_mystere.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  static Future<Database> _initialize() async {
    final path = await fullPath;
    var database = openDatabase(
        path
    );
    database.then((db) async {
      if (kDebugMode) {
        await create(db);
      }
    });
    return database;
  }

  static Future<void> create(Database db) async {
    await db.execute('''
    DROP TABLE IF EXISTS SCORE;
    
    CREATE TABLE SCORE (
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    nom   VARCHAR(42),
    score VARCHAR(42)
    );
    ''');
  }
}