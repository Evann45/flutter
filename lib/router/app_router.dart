import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/firstScreens.dart';
import '../ui/gameScreen.dart';
import '../ui/shellroutes.dart';
import '../ui/gameScreen.dart';

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
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: [
            GoRoute(
              path: 'a',
              builder: (BuildContext context, GoRouterState state) {
                return const ScreenA();
              },
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const DetailScreenNavBar(label: 'A');
                  },
                )
              ],
            ),
            GoRoute(
              path: 'b',
              builder: (BuildContext context, GoRouterState state) {
                return const ScreenB();
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: 'details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const DetailScreenNavBar(label: 'B');
                  },
                )
              ],
            ),
            GoRoute(
              path: 'c',
              builder: (BuildContext context, GoRouterState state) {
                return const ScreenC();
              },
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const DetailScreenNavBar(label: 'C');
                  },
                )
              ],
            ),
          ],
        )
      ],
    ),
    GoRoute(
      path: '/details/:id',
      name: 'details',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return DetailsScreen(id: id);
      },
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final id = state.uri.queryParameters['search'];
        return DetailsScreen(id: id);
      },
    ),
    GoRoute(
      path: '/game', // Chemin vers l'écran du jeu
      builder: (context, state) => const GameScreen(), // Constructeur de GameScreen
    ),
  ],
);
