import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'game.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  TextEditingController _guessController = TextEditingController();
  List<int> _guesses = [];
  late int _targetPrice;
  String _guessResult = ''; // Ajoutez la variable pour stocker le résultat de l'estimation

  @override
  void initState() {
    super.initState();
    _generateTargetPrice();
  }

  void _generateTargetPrice() {
    final Random rand = Random();
    _targetPrice = rand.nextInt(100) + 1;
  }

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
            Text(
              'Prix caché : $_targetPrice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _guessController,
              decoration: InputDecoration(
                labelText: 'Estimation du prix',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitGuess(context);
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
            Text(
              'Estimations précédentes :',
              style: TextStyle(fontSize: 18),
            ),
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
          ],
        ),
      ),
    );
  }

  void _submitGuess(BuildContext context) {
    if (_guessController.text.isNotEmpty) {
      int guess = int.tryParse(_guessController.text) ?? 0;
      String result = _checkGuess(guess);
      setState(() {
        _guessResult = result;
        _guesses.add(guess);
        _guessController.clear();
      });
    }
  }

  String _checkGuess(int guess) {
    if (guess < _targetPrice) {
      return 'Trop bas';
    } else if (guess > _targetPrice) {
      return 'Trop haut';
    } else {
      return 'Bravo, vous avez trouvé le juste prix !';
    }
  }
}