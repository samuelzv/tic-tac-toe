import 'dart:math';
import 'cell.dart';
import 'player.dart';

class Board {
  final int _boardSize = 3;
  List<List<Cell>> _cells;

  Board() {
    _setInitialCells();
  }

  void _setInitialCells() {
    // setCells(_getInitialCells(_boardSize));
    _cells = List<List<Cell>>.generate(_boardSize, (int row) => 
      List<Cell>.generate(_boardSize, (int column) => Cell(row, column)));
  }

  void setCell(CellPosition cellPosition, Player player) {
    _cells[cellPosition.row][cellPosition.column].choose(player);
  }

  void setCells(List<List<Cell>> cells) => _cells = cells;

  List<List<Cell>> getCells() => _cells;

  CellPosition getRandomEmptyCell() {
    final random = Random();
    List<CellPosition> emptyCells = _getPositionsFromType(null);
    int randomIndex = random.nextInt(emptyCells.length);
    return (emptyCells.isNotEmpty) ? emptyCells[randomIndex] : null;
  }

   List<CellPosition> _getPositionsFromType(Player player) {
    List<CellPosition> cellsFromType = [];
    for(int row = 0; row < _cells.length; row++) {
      for (int column = 0; column < _cells.length; column++) {
        if (_cells[row][column].value == player) {
          cellsFromType.add(CellPosition(row, column));
        }
      }
    }

    return cellsFromType; 
  }

  bool isBoardFull() {
    return _getPositionsFromType(null).isEmpty;
  }

  List<CellPosition> get humanMovements {
     return _getPositionsFromType(Player.human);
  }

  List<CellPosition> get computerMovements {
     return _getPositionsFromType(Player.computer);
  }

  bool isCellAvailable(CellPosition cellPosition) {
    return _cells[cellPosition.row][cellPosition.column].value == null;
  }

  String toString() {
    String value =  "";

    for(int row = 0; row < _cells.length; row++) {
      for (int column = 0; column < _cells.length; column++) {
        value += 'row: ${row}, column:$column, value: ${_cells[row][column].value}\n';
      }
    }

    return value;
  }

  void standoutWinningCombination(List<CellPosition> winningCombination) {
    if (winningCombination == null) {
      return;
    }

     for(int row = 0; row < _cells.length; row++) {
      for (int column = 0; column < _cells.length; column++) {
        winningCombination.forEach((CellPosition position) {
          if (row == position.row && column == position.column) {
            _cells[row][column].belongsToWinningCombination = true;
          }
        });
      }
    }
  }
}