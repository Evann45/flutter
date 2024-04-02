import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/gameScreen.dart';

class LooseScreen extends StatelessWidget {
  const LooseScreen({Key? key}) : super(key: key);

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
                'Bien essayé, mais vous avez perdu.',
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
                onPressed: () => context.go('/home/difficulte'),
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
