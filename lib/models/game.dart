import 'dart:math';

class Game {
  late int _minPrice;
  late int _maxPrice;
  int _score;
  int _targetPrice = 0;
  int _life;

  Game({int minPrice = 1, int maxPrice = 100, int score = 0,int life = 0}) :
        _minPrice = minPrice,
        _score = score,
        _life = life,
        _maxPrice = maxPrice{_generateTargetPrice();}

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get targetPrice => _targetPrice;
  int get score => _score;
  int get life => _life;

  void _chooseLife(String context){
    if(context == 'facile'){
      this._life = 100;
    }
    else if(context == 'Moyen'){
      this._life = 30;
    }
    else if(context == 'Difficile'){
      this._life = 10;
    }
  }

  void _generateTargetPrice() {
    final Random rand = Random();
    _targetPrice = _minPrice + rand.nextInt(_maxPrice - _minPrice + 1);
  }

  void _resetScore(){
    this._score = 0;
  }

  void resetGame() {
    _generateTargetPrice();
    _resetScore();
  }

  String checkGuess(int guess) {
    if (guess < _targetPrice) {
      return 'Trop bas';
    } else if (guess > _targetPrice) {
      return 'Trop haut';
    } else {
      return 'Bravo, vous avez trouvé le juste prix !';

    }
  }

  void incrementScore() {
    this._score += 1;
  }
}
