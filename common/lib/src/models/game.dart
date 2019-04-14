import 'board.dart';
import 'cell.dart';
import 'player.dart';
import 'game_state.dart';
import 'score.dart';

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
    _gameState = GameState(cells: _board.getCells());
  }

  setState(GameState newState) {
    _board.setCells(newState.cells);
    _gameState = newState;
  }

  set username(String value) {
    _gameState.username = value;
  }

  set score(GameScore score) {
    _gameState.score = score;
  }

  void makeMovement([CellPosition cellPosition]) {
    if (_gameState.isGameOver) {
      return;
    }

    if (_gameState.turn == Player.human) {
      if (_board.isCellAvailable(cellPosition)) {
      _makeHumanMovement(cellPosition);
      }
    } else {
      _makeComputerMovement(cellPosition);
    }

    _gameState.phase = _determineGamePhase();
    if (_gameState.isGameOver) {
      _updateScore();
    } else {
      _shiftTurn();
    }
  }

  void _updateScore() {
    if (_gameState.isGameTied) {
      _gameState.score.tied += 1;
      return;
    }

    if (_gameState.turn == Player.computer) {
      _gameState.score.computer += 1;
    } else if (_gameState.turn == Player.human) {
      _gameState.score.human += 1;
    } 
  }

  GamePhase _determineGamePhase() {
      _gameState.winningCombination = _getWinningCombination(_getMovementsFromCurrentPlayer());
      if (_isThereSomeWinner()) {
        return GamePhase.Finished;
      } else {
        // if there is no more cells to choose
        if (_isGameTied()) {
          return GamePhase.Tied;
        } else {
          return GamePhase.Started;
        }
      }
  }

  List<CellPosition> _getMovementsFromCurrentPlayer() {
      return _gameState.turn == Player.human ? _board.humanMovements : _board.computerMovements;
  }

  bool _isGameTied() => _board.isBoardFull();
  
  bool _isThereSomeWinner() => _gameState.winningCombination.isNotEmpty;

  void _shiftTurn() {
    _gameState.turn = (_gameState.turn == Player.human ? Player.computer : Player.human);
  }

  void _makeHumanMovement(CellPosition cellPosition) {
      _board.setCell(cellPosition, Player.human);
  }

  void _makeComputerMovement([CellPosition cellPosition]) {
      CellPosition targetPosition = cellPosition ?? _board.getRandomEmptyCell();

      if (targetPosition != null) {
        _board.setCell(targetPosition, Player.computer);
      }
  }

  List<CellPosition> _getWinningCombination(List<CellPosition> movements) {
    int index = 0;
    bool isGameOver = false;
    List<CellPosition> winningCombination = [];

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

      if (isGameOver) {
        winningCombination = _winningCombinations[index];
      } else {
        index = index + 1;
      }
    }

    return winningCombination;
  }

  List<List<Cell>> _getCells() => (_board != null) ?_board.getCells() : null;

  GameState get state {
    return _gameState
            ..cells =_getCells();
  }
}