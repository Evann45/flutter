import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/gameScreen.dart';
import 'package:projet3/models/Score.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu du Juste Prix'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bravo vous avez gagner',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Le nombre était : ${GameScreen.targetPrice}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Tentative: ${GameScreen.life}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    showPopup(context, GameScreen.life);
                  }, child: Text('Enregistrer votre score'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/difficulte'),
                child: Text('Rejouer'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: Text('Retour à l\'accueil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showPopup(BuildContext context, int score) {
  String nom = '';
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enregistrer votre score'),
        content: TextField(
          onChanged: (value) {
            nom = value;
          },
          decoration: InputDecoration(
            hintText: 'Entrer votre nom',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Score.registerScore(nom, score);
              Navigator.of(context).pop();
            },
            child: Text('Confirmer'),
          ),
        ],
      );
    },
  );
}