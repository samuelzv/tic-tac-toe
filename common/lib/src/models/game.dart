import 'board.dart';
import 'cell.dart';
import 'cell_value.dart';

class GameState {
  final List<List<Cell>> cells;

  GameState({this.cells});
}

class Game {
  Board _board;

  Game() {
    _board =Board();
  }

  factory Game.fromState(GameState gameState) {
    Game game = Game();
    game._board.setCells(gameState.cells);

    return game;
  }

  void start(int size) {
    _board.setInitialCells(size);
  }

  void setCellValue(int row, int column, CellValue value) {
    _board.setCellValue(row, column, value);
  }

  List<List<Cell>> _getCells() => (_board != null) ?_board.getCells() : null;

  GameState get state {
    return GameState(cells: _getCells());
  }

}