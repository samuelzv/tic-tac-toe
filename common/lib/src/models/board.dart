import 'dart:math';
import 'cell.dart';
import 'cell_value.dart';


class Board {
  List<List<Cell>> _cells;

  Board();

  void setInitialCells(size) {
    setCells(_getInitialCells(size));
  }

  List<List<Cell>> _getInitialCells(int size) {
    return List<List<Cell>>.generate(size, (int row) => 
      List<Cell>.generate(size, (int column) => Cell(CellValue.empty)));
  }

  void setCellValue(int row, int column, CellValue value) {
    _cells[row][column].setValue(value);
  }

  void setCells(List<List<Cell>> cells) => _cells = cells;

  List<List<Cell>> getCells() => _cells;

  CellPosition getRandomEmptyCell() {
    final random = Random();

    List<CellPosition> emptyCells = _getPositionsFromType(CellValue.empty);
    int randomIndex = random.nextInt(emptyCells.length);

    return (emptyCells.isNotEmpty) ? emptyCells[randomIndex] : null;
  }

   List<CellPosition> _getPositionsFromType(CellValue value) {
    List<CellPosition> cellsFromType = [];

    for(int row = 0; row < _cells.length; row++) {
      for (int column = 0; column < _cells.length; column++) {
        if (_cells[row][column].getValue() == value) {
          cellsFromType.add(CellPosition(row, column));
        }
      }
    }

    return cellsFromType; 
  }

  List<CellPosition> get humanMovements {
     return _getPositionsFromType(CellValue.cross);
  }

  List<CellPosition> get computerMovements {
     return _getPositionsFromType(CellValue.nought);
  }
}