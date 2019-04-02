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
    _gameState = GameState('', Player.human, [], false);
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
    if (!_gameState.isGameOver) {
      _board.setCellValue(row, column, CellValue.cross);
      if (isGameWon(_board.humanMovements)) {
        _gameState.isGameOver = true;
      } else {
        _gameState.turn = Player.computer;
      }
    }
  }

  void makeComputerMovement() {
    if (!_gameState.isGameOver) {
      CellPosition cellPosition = _board.getRandomEmptyCell();
      if (cellPosition != null) {
        _board.setCellValue(cellPosition.row, cellPosition.column, CellValue.nought);
        if (isGameWon(_board.computerMovements)) {
          _gameState.isGameOver = true;
        } else {
          _gameState.turn = Player.human;
        }
      }
    }
  }

  bool isGameWon(List<CellPosition> movements) {
    List<List<CellPosition>> winPositions = [
      /* horizontal */
      [CellPosition(0, 0), CellPosition(0, 1), CellPosition(0, 2)],
      [CellPosition(1, 0), CellPosition(1, 1), CellPosition(1, 2)],
      [CellPosition(2, 0), CellPosition(2, 1), CellPosition(2, 2)],
      /* vertical */
      [CellPosition(0, 0), CellPosition(1, 0), CellPosition(2, 0)], 
      [CellPosition(0, 1), CellPosition(1, 1), CellPosition(2, 1)],
      [CellPosition(0, 2), CellPosition(1, 2), CellPosition(2, 2)],
      /* diagonal */
      [CellPosition(0, 0), CellPosition(1, 1), CellPosition(2, 2)], 
      [CellPosition(0, 2), CellPosition(1, 1), CellPosition(2, 0)], 
    ];

    int index = 0;
    bool isGameOver = false;

    while (!isGameOver && index < winPositions.length) {
      index = index + 1;

      isGameOver = winPositions[index].every((CellPosition position) {
        bool contains = false;

        for (int i = 0; i < movements.length; i++) {
          if (position.column == movements[i].column && position.row == movements[i].row) {
            contains = true;
            break;
          }
        }

        return contains;
      });

    }

    return isGameOver;
  }

  List<List<Cell>> _getCells() => (_board != null) ?_board.getCells() : null;

  GameState get state {
    return _gameState
            ..cells =_getCells();
  }
}