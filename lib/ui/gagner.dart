import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/gameScreen.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({super.key});

  @override
  _WinScreenState createState() => _WinScreenState();

}

class _WinScreenState extends State<WinScreen> {
  final GameScreen _game = GameScreen(); // Créez une instance de jeu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu du Juste Prix'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Tentative : ${_game.score}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            // Bouton pour réinitialiser le jeu
            // Boutons pour réinitialiser le jeu et retourner à la page d'accueil
            Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () =>  context.go('/'),
                    child: Text('Retour à l\'accueil'),
                  ),
                  SizedBox(width: 630), // Espacement entre les boutons
                  ElevatedButton(
                    onPressed: () =>  context.go('/game'),
                    child: Text('Rejouer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
