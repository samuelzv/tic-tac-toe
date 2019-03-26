import 'cell.dart';
import 'cell_value.dart';

class Board {
  final int size;
  List<List<Cell>> _board;

  Board(this.size) {
    _board =_getInitialBoard();
    print('Setting up Initial board');
    print(_board);
  }

  _getInitialBoard() {
    return List<List<Cell>>.generate(size, (int row) => 
      List<Cell>.generate(size, (int column) => Cell(CellValue.empty)));
  }

  void setCellValue(int row, int column, CellValue value) {
    _board[row][column].setValue(value);
  }

  List<List<Cell>> getBoard() => _board;
}