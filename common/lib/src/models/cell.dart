import './player.dart';

const String HUMAN_ICON = 'pets';
const String COMPUTER_ICON = 'android';

class Cell {
  String _icon = '';
  Player _value;
  bool _belongsToWinningCombination = false;
  final CellPosition _position;

  Cell(int row, int column): _position = CellPosition(row, column);

  void choose(Player player) {
    _value = player;
    _icon = (player == Player.human ? HUMAN_ICON : COMPUTER_ICON);
  }

  CellPosition get position {
    return _position;
  }

  bool get belongsToWinningCombination {
    return _belongsToWinningCombination;
  }
  set belongsToWinningCombination(bool belongs) {
    _belongsToWinningCombination = belongs;
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