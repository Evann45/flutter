import 'package:projet3/models/Joueur.dart';

class Score {
  int id;
  Joueur joueur;
  int score;

  Score(this.id, this.joueur, this.score);

  factory Score.fromMap(Map<String, dynamic> json) {
    return Score(
      json['id'],
      Joueur.fromMap(json['joueur']),
      json['score'],
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'joueur': joueur.toMap(),
    'score': score,
  };
}