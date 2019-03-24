import 'cell.dart';
import 'cell_value.dart';

class Board {
  final int size = 3;
  List<List<Cell>> _board;

  Board() {
    _board =_generateBoard();
    print(_board);
  }

  _generateBoard() {
    return List<List<Cell>>.generate(size, (i) => 
      List<Cell>.generate(size, (j) => Cell(i, j, CellValue.empty)));
  }

}