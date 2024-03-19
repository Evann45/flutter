import 'dart:math';

class Game {
  final int _minPrice;
  final int _maxPrice;
  int _targetPrice = 0;

  Game({int minPrice = 1, int maxPrice = 100}) :
        _minPrice = minPrice,
        _maxPrice = maxPrice {
  }

  int get minPrice => _minPrice;
  int get maxPrice => _maxPrice;
  int get targetPrice => _targetPrice;

}
