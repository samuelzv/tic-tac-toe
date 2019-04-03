import 'dart:math';
import 'cell.dart';
import 'player.dart';

class Board {
  List<List<Cell>> _cells;

  void setInitialCells(size) {
    setCells(_getInitialCells(size));
  }

  List<List<Cell>> _getInitialCells(int size) {
    return List<List<Cell>>.generate(size, (int row) => 
      List<Cell>.generate(size, (int column) => Cell()));
  }

  void chooseCell(CellPosition cellPosition, Player player) {
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

  List<CellPosition> get humanMovements {
     return _getPositionsFromType(Player.human);
  }

  List<CellPosition> get computerMovements {
     return _getPositionsFromType(Player.computer);
  }
}