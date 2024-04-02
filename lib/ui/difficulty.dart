import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu du Juste Prix'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.account_circle),
            onChanged: (String? value) {
              if (value == 'Accueil') {
                context.go('/');
              } else if (value == ' Parametre') {
                context.go('/home/a');
              }
            },
            items: [
              DropdownMenuItem(
                value: 'Accueil',
                child: Text('Accueil'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDifficultyButton(context, 'Facile', 'Défi parfait pour les débutants.'),
            SizedBox(height: 20),
            _buildDifficultyButton(context, 'Moyen', 'Un défi pour les joueurs expérimentés.'),
            SizedBox(height: 20),
            _buildDifficultyButton(context, 'Difficile', 'Pour les joueurs chevronnés prêts pour un vrai défi.'),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyButton(BuildContext context, String difficulty, String description) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            startNewGame(context, difficulty);
          },
          child: Text(
            difficulty,
            style: TextStyle(fontSize: 24), // Taille de police augmentée
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Ajout de padding horizontal
          child: Text(
            description,
            textAlign: TextAlign.center, // Centrage du texte
            style: TextStyle(fontSize: 16), // Taille de police ajustée
          ),
        ),
      ],
    );
  }

  void startNewGame(BuildContext context, String difficulty) {
    // Naviguer vers l'écran de jeu en passant la difficulté choisie comme paramètre
    GoRouter.of(context).go('/game/$difficulty');
  }
}
