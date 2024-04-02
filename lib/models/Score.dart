import 'package:projet3/database/database_service.dart';

class Score {
  static registerScore(String nom, int score) {
    DatabaseService.database.then((db) => db.insert('SCORE', {'nom': nom, 'score': score,}));
  }

  static Future<List<Map<String, dynamic>>> getScores() async {
    final db = await DatabaseService.database;
    return db.query('SCORE', orderBy: 'score DESC', limit: 10);
  }
}