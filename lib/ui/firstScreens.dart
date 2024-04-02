import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Lancer une Partie'),
              onPressed: () => {
                context.go('/home/difficulte'),
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Voir mes Scores'),
              onPressed: () => context.go('/home/scores'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Règles du jeu'),
              onPressed: () => context.go('/home/about'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Paramètres'),
              onPressed: () => context.go('/parametre'),
            ),
          ],
        ),
      ),
    );
  }
}



class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Règles du jeu'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Règles du nombre mystère",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. Vous devez deviner un nombre mystère.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "2. Vous devez proposer un nombre",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "3. Le jeu vous répondra si le nombre mystère est plus grand ou plus petit que le nombre proposé.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "4. Si le nombre proposer est égale au nombre mystère, le joueur gagne.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "5. Sinon, s'il n'a plus de tentative il perd et peut retenter sa chance.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}