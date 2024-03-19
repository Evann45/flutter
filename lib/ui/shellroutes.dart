import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget{
  final Widget child;

  const ScaffoldWithNavBar({required this.child,super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shell Route'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Screen A'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Screen B'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Luminosité'
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemtapped(index,context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if(location.startsWith('/home/a')){
      return 0;
    }
    if(location.startsWith('/home/b')){
      return 1;
    }
    if(location.startsWith('/home/c')){
      return 2;
    }
    return 0;
  }

  void _onItemtapped(int index, BuildContext context) {
    switch(index){
      case 0:
        GoRouter.of(context).go('/home/a');
      case 1:
        GoRouter.of(context).go('/home/b');
      case 2:
        GoRouter.of(context).go('/home/c');
    }
  }

}


class ScreenA extends StatelessWidget{
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          children: [
            const Text('ScreenA'),
            TextButton(
                onPressed: (){
                  GoRouter.of(context).go('/home/a/details');
                },
                child: const Text('Go to details'))
          ],
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget{
  const ScreenB({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body:  Center(
      child: Column(
        children: [
          const Text('ScreenB'),
          TextButton(
              onPressed: (){
                GoRouter.of(context).go('/home/b/details');
              },
              child: const Text('Go to details'))
        ],
      ),
    ),
  );
}
}

class ScreenC extends StatelessWidget{
  const ScreenC({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Column(
        children: [
          const Text('ScreenC'),
          TextButton(
              onPressed: (){
                GoRouter.of(context).go('/home/c/details');
              },
              child: const Text('Go to details'))
        ],
      ),
    ),
  );
}
}

class DetailScreenNavBar extends StatelessWidget{

  final String label;

  const DetailScreenNavBar({required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Text('Detail for $label',style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );

  }

}