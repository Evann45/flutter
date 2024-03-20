import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              onPressed: () {
                startNewGame(context);
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Voir mes Scores'),
              onPressed: () => context.go('/details?search=222'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Règles du jeu'),
              onPressed: () => context.go('/home/about'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Paramètres'),
              onPressed: () => context.go('/home/a'),
            ),
          ],
        ),
      ),
    );
  }

  void startNewGame(BuildContext context) {
    // Naviguer vers l'écran de jeu
    GoRouter.of(context).go('/game');
  }
}


class DetailsScreen extends StatelessWidget{
  final String? id;

  const DetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen'),
      ),
      body: Center(
        child:
        Column(
          children: [
            Text("Voici l'id : $id"),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              child: const Text('Go to home'),
              onPressed: () => context.goNamed('home'),
            )
          ],
        )
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
                "Règles du jeu du Juste Prix",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. Un prix est affiché.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "2. Le joueur doit estimer le prix du produit.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "3. Le joueur propose son estimation.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "4. Si le prix proposé est proche du prix réel sans le dépasser, le joueur gagne.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "5. Sinon, il perd et peut retenter sa chance.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}