import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'nombre_mystere.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
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

  Future<void> create(Database db) async {
    await db.execute('''
    DROP TABLE IF EXISTS AFAIT;
    DROP TABLE IF EXISTS JOUEUR;
    DROP TABLE IF EXISTS SCORE;
    
    CREATE TABLE JOUEUR (
    id  INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(42)
    );
    
    CREATE TABLE SCORE (
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    SCORE VARCHAR(42)
    );
    
    CREATE TABLE AFAIT (
    id_j INTEGER NOT NULL,
    id_s INTEGER NOT NULL,
    PRIMARY KEY (id_j, id_s),
    FOREIGN KEY (id_s) REFERENCES SCORE (id),
    FOREIGN KEY (id_j) REFERENCES JOUEUR (id)
    );
    ''');
  }
}
// https://www.youtube.com/watch?v=9kbt4SBKhm0