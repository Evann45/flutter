import 'dart:math';

class Game {
  final int _minPrice;
  final int _maxPrice;
  int _targetPrice = 0;

  Game({int minPrice = 1, int maxPrice = 100}) :
        _minPrice = minPrice,
        _maxPrice = maxPrice {_generateTargetPrice();}

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get targetPrice => _targetPrice;

  void _generateTargetPrice() {
    final Random rand = Random();
    _targetPrice = _minPrice + rand.nextInt(_maxPrice - _minPrice + 1);
  }

  void resetGame() {
    _generateTargetPrice();
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

}
