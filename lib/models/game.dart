import 'dart:math';

class Game {
  final int _minPrice;
  final int _maxPrice;
  int _life = 10;
  int _number = 0;

  Game({int minPrice = 1, int maxPrice = 100}) :
        _minPrice = minPrice,
        _maxPrice = maxPrice {_generateNumber();}

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get life => _life;
  int get number => _number;

  void _generateNumber() {
    final Random rand = Random();
    _number = _minPrice + rand.nextInt(_maxPrice - _minPrice + 1);
  }

  void resetGame() {
    _generateNumber();
  }

  int checkGuess(int guess) {
    if (guess < _number) {
      _life--;
      return -1;
    } else if (guess > _number) {
      _life--;
      return 1;
    } else {
      return 0;
    }
  }

  bool isGameOver() {
    return _life == 0;
  }

}
