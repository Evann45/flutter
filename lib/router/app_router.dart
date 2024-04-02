import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projet3/ui/gagner.dart';
import '../ui/ScoresScreen.dart';
import '../ui/difficulty.dart';
import '../ui/firstScreens.dart';
import '../ui/gameScreen.dart';
import '../ui/perdu.dart';
import '../ui/Parametre.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state) => '/home',
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'about',
          builder: (context, state) => const AboutScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/game/:difficulty', // Chemin vers l'écran du jeu avec la difficulté comme paramètre
      name: 'game',
      builder: (context, state) {
        final difficulty = state.pathParameters['difficulty']; // Récupérer la difficulté depuis les paramètres de l'URL
        return GameScreen(difficulty: difficulty!); // Passer la difficulté à GameScreen
      },
    ),
    GoRoute(
      path: '/parametre',
      builder: (context, state) => const Parametre(),
    ),
    GoRoute(
      path: '/game', // Chemin vers l'écran du jeu
      builder: (context, state) {
        final difficulty = state.uri.queryParameters['search'];
        if (difficulty != null) {
          return GameScreen(difficulty: difficulty);
        } else {
          // Gérer le cas où la difficulté n'est pas spécifiée
          // Peut-être rediriger l'utilisateur vers la page de sélection de la difficulté
          return Container(); // Ou un autre widget vide, ou une page d'erreur, selon vos besoins
        }
      },
    ),
    GoRoute(
        path: '/win',
        builder: (context,state) => const WinScreen(),
    ),
    GoRoute(
      path: '/loose',
      builder: (context,state) => const LooseScreen(),
    ),
    GoRoute(
        path: '/difficulte',
      builder: (context,state) => const DifficultyPage(),
    ),
    GoRoute(path: '/scores',
      builder: (context, state) => const ScoresScreen()
    ),
  ],
);
