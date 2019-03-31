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
    List<CellPosition> emptyCells = [];
    final random = Random();

    for(int row = 0; row < _cells.length; row++) {
      for (int column = 0; column < _cells.length; column++) {
        if (_cells[row][column].getValue() == CellValue.empty) {
          emptyCells.add(CellPosition(row, column));
        }
      }
    }

    int randomIndex = random.nextInt(emptyCells.length);

    return (emptyCells.isNotEmpty) ? emptyCells[randomIndex] : null;
  }

}