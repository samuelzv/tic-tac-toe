import 'board.dart';
import 'cell.dart';
import 'cell_value.dart';
import 'player.dart';
import 'game_state.dart';


class Game {
  Board _board;
  GameState _gameState;

  Game() {
    _board = Board();
    _gameState = GameState('', Player.human, []);
  }

  setState(GameState newState) {
    _board.setCells(newState.cells);
    _gameState = newState;
  }

  void start(int size) {
    _board.setInitialCells(size);
  }

  set username(String value) {
    _gameState.username = value;
  }

  void makeHumanMovement(int row, int column) {
    _board.setCellValue(row, column, CellValue.cross);
    _gameState.turn = Player.computer;
  }

  List<List<Cell>> _getCells() => (_board != null) ?_board.getCells() : null;

  GameState get state {
    return _gameState
            ..cells =_getCells();
  }
}