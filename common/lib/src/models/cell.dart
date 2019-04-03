import './player.dart';

class Cell {
  String _icon = '';
  Player _value;

  void choose(Player player) {
    _value = player;
    _icon = (player == Player.human ? 'pets' : 'android');
  }

  String get icon {
    return _icon;
  }

  Player get value {
    return _value;
  }
}

class CellPosition {
  int row;
  int column;

  CellPosition(this.row, this.column);
}