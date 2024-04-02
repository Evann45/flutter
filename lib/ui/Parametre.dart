import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Parametre extends StatelessWidget{

  const Parametre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      actions: [
        DropdownButton(
          icon: Icon(Icons.account_circle),
          onChanged: (String? value) {
            if (value == 'Accueil') {
              context.go('/');
            } else if (value == ' Parametre') {
              context.go('/home/a');
            }
          },
          items: [
            DropdownMenuItem(
              value: 'Accueil',
              child: Text('Accueil'),
            ),
          ],
        ),
      ],),
        body: Center(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Paramètres',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

