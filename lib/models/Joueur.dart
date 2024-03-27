class Joueur {
  final int id;
  final String nom;

  Joueur(this.id, this.nom);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
    };
  }

  factory Joueur.fromMap(Map<String, dynamic> map) {
    return Joueur(
      map['id'],
      map['nom'],
    );
  }
}