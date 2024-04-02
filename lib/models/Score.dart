import 'package:projet3/database/database_service.dart';
import 'package:sqflite/sqflite.dart';

class Score {
  static registerScore(String nom, int score) async {
    DatabaseHelper databaseService = DatabaseHelper();
    Database db = await databaseService.db;
    await db.insert('SCORE', {'nom': nom, 'score': score});
  }

  static Future<List<Map<String, dynamic>>> getScores() async {
    DatabaseHelper databaseService = DatabaseHelper();
    Database db = await databaseService.db;
    return db.query('SCORE', orderBy: 'score DESC', limit: 10);
  }
}