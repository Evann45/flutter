import 'dart:math';

class Game {
  late int _minPrice;
  late int _maxPrice;
  int _score;
  int _targetPrice = 0;

  Game({int minPrice = 1, int maxPrice = 100, int score = 0}) :
        _minPrice = minPrice,
        _score = score,
        _maxPrice = maxPrice{_generateTargetPrice();}

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get targetPrice => _targetPrice;
  int get score => _score;

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
