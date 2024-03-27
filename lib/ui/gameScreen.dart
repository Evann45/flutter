import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static int score = _GameScreenState._getScore();

  @override
  _GameScreenState createState() => _GameScreenState();


}

class _GameScreenState extends State<GameScreen> {
  TextEditingController _guessController = TextEditingController();
  List<int> _guesses = [];
  late int _targetPrice;
  String _guessResult = ''; // Ajoutez la variable pour stocker le résultat de l'estimation

  static Game _game = Game(); // Créez une instance de jeu

  @override
  void initState() {
    super.initState();
    _resetGame(); // Appeler la fonction de réinitialisation au démarrage de l'écran
  }

  void _resetGame() {
    setState(() {
      _game.resetGame(); // Réinitialiser le jeu en appelant la méthode resetGame de l'instance de jeu
      _guesses.clear(); // Effacer les estimations précédentes
      _guessResult = ''; // Réinitialiser le résultat d'estimation
    });
  }


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
              } else if (value == 'Réinitialiser le jeu') {
                _resetGame();
              } else if (value == ' Parametre') {
                context.go('/home/a');
              }
            },
            items: [
              DropdownMenuItem(
                value: 'Accueil',
                child: Text('Accueil'),
              ),
              DropdownMenuItem(
                value: 'Réinitialiser le jeu',
                child: Text('Réinitialiser le jeu'),
              ),
            ],
          ),
        ],
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
            SizedBox(height: 100),
            TextField(
              scrollPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              controller: _guessController,
              decoration: InputDecoration(
                labelText: 'Estimation du prix',
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly // Permet uniquement les chiffres
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitGuess(context);
                _game.incrementScore();
              },
              child: Text('Valider'),
            ),
            SizedBox(height: 20),
            Text(
              _guessResult, // Affichez le résultat de l'estimation
              style: TextStyle(
                fontSize: 18,
                color: _guessResult == 'Trop haut' || _guessResult == 'Trop bas' ? Colors.red : Colors.green, // Couleur différente si le résultat est trop haut ou trop bas
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _guesses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Estimation ${index + 1} : ${_guesses[index]}'),
                  );
                },
              ),
            ),
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
                    onPressed: _resetGame,
                    child: Text('Réinitialiser le jeu'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitGuess(BuildContext context) {
    if (_guessController.text.isNotEmpty) {
      int guess = int.tryParse(_guessController.text) ?? 0;
      String result = _game.checkGuess(guess); // Utilisez la méthode checkGuess de l'instance de jeu
      setState(() {
        _guessResult = result;
        _guesses.add(guess);
        _guessController.clear();
      });
      if (guess == _game.targetPrice) {
        // Si le guess est correct, naviguer vers '/game/win'
        context.go('/game/win');
      }
    }
  }
  static int _getScore() {
    return _game.score;
  }
}
