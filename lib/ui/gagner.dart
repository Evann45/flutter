import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/gameScreen.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

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
                'Fin du jeu',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Score: ${GameScreen.score}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => context.go('/game'),
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
