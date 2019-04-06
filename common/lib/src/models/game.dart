import 'board.dart';
import 'cell.dart';
import 'player.dart';
import 'game_state.dart';

class Game {
  Board _board;
  GameState _gameState;
  List<List<CellPosition>> _winningCombinations = [];

  Game() {
    _winningCombinations = [
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
    _board = Board();
    _gameState = GameState('', Player.human, [], false);
  }

  setState(GameState newState) {
    _board.setCells(newState.cells);
    _gameState = newState;
  }

  void start() {
    _board.setInitialCells();
    // todo remove it
    _gameState.isGameOver = false;
    _gameState.turn = Player.human;
    _gameState.isGameTied = false;
    _gameState.isPristine = true;
  }

  set username(String value) {
    _gameState.username = value;
  }

  void makeMovement([CellPosition cellPosition]) {
    if (_gameState.isGameOver) {
      return;
    }

    _gameState.isPristine = false;
    if (_gameState.turn == Player.human) {
      if (_board.isCellAvailable(cellPosition)) {
      _makeHumanMovement(cellPosition);
      }
    } else {
      _makeComputerMovement(cellPosition);
    }
    if (!_determineWinner()) {
      _shiftTurn();
    }
  }
  bool _determineWinner() {
      if (_isWinningCombination(_getMovementsFromCurrentPlayer())) {
        _gameState.isGameOver = true;
        return true;
      } else {
        // if there is no more cells to choose
        if (_isGameTied()) {
          _gameState.isGameOver = true;
          _gameState.isGameTied = true;
          return true;
        } 
      }
      return false;
  }

  List<CellPosition> _getMovementsFromCurrentPlayer() {
      return _gameState.turn == Player.human ? _board.humanMovements : _board.computerMovements;
  }

  bool _isGameTied() => _board.isBoardFull();

  void _shiftTurn() {
    _gameState.turn = (_gameState.turn == Player.human ? Player.computer : Player.human);
  }

  void _makeHumanMovement(CellPosition cellPosition) {
      _board.chooseCell(cellPosition, Player.human);
  }

  void _makeComputerMovement([CellPosition cellPosition]) {
      CellPosition targetPosition = cellPosition ?? _board.getRandomEmptyCell();

      if (targetPosition != null) {
        _board.chooseCell(targetPosition, Player.computer);
      }
  }

  bool _isWinningCombination(List<CellPosition> movements) {
    int index = 0;
    bool isGameOver = false;

    while (!isGameOver && index < _winningCombinations.length) {
      isGameOver = _winningCombinations[index].every((CellPosition position) {
        bool contains = false;

        for (int i = 0; i < movements.length; i++) {
          if (position.column == movements[i].column && position.row == movements[i].row) {
            contains = true;
            break;
          }
        }
        return contains;
      });

      index = index + 1;
    }

    return isGameOver;
  }

  List<List<Cell>> _getCells() => (_board != null) ?_board.getCells() : null;

  GameState get state {
    return _gameState
            ..cells =_getCells();
  }
}