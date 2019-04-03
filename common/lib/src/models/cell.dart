import './player.dart';

const String HUMAN_ICON = 'pets';
const String COMPUTER_ICON = 'android';

class Cell {
  String _icon = '';
  Player _value;

  void choose(Player player) {
    _value = player;
    _icon = (player == Player.human ? HUMAN_ICON : COMPUTER_ICON);
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