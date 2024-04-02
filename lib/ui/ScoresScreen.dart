import 'package:flutter/material.dart';
import 'package:projet3/models/Score.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scores',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: Score.getScores(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final scores = snapshot.data!;
                    return Column(
                      children: scores.map((score) {
                        return Text(
                          '${score['nom']} : ${score['score']}',
                          style: TextStyle(fontSize: 20),
                        );
                      }).toList(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}