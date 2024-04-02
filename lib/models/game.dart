import 'dart:math';

class Game {
  late int _minPrice;
  late int _maxPrice;
  int _targetPrice = 0;
  int _life = 0;

  Game({String difficulty = 'Facile'}) {
    _life = life;
    if (difficulty == 'Facile') {
      _minPrice = 1;
      _maxPrice = 100;
      _chooseLife('Facile');
    } else if (difficulty == 'Moyen') {
      _minPrice = 1;
      _maxPrice = 1000;
      _chooseLife('Moyen');
    } else if (difficulty == 'Difficile') {
      _minPrice = 1;
      _maxPrice = 10000;
      _chooseLife('Difficile');
    }
    _generateTargetPrice(); // Générer le prix cible en fonction de la plage des prix
  }

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get targetPrice => _targetPrice;
  int get life => _life;

  void _chooseLife(String context){
    if(context == 'Facile'){
      this._life = 10;
    }
    else if(context == 'Moyen'){
      this._life = 10;
    }
    else if(context == 'Difficile'){
      this._life = 10;
    }
  }

  void _generateTargetPrice() {
    final Random rand = Random();
    _targetPrice = _minPrice + rand.nextInt(_maxPrice - _minPrice + 1);
  }


  void resetGame() {
    _generateTargetPrice();
    _life = 10;
  }

  int checkGuess(int guess) {
    if (guess < _targetPrice) {
      _life--;
      return -1;
    } else if (guess > _targetPrice) {
      _life--;
      return 1;
    } else {
      return 0 ;

    }
  }


  bool isGameOver() {
    return _life == 0;
  }
}
