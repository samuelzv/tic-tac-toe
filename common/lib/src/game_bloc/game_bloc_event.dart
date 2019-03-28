import '../bloc_event.dart';
import '../models/cell_value.dart';

class GameStartBlocEvent extends BlocEvent {
  final int boardSize;

  GameStartBlocEvent(this.boardSize);
}

class GameMoveBlocEvent extends BlocEvent {
  final int row;
  final int column;
  final CellValue value;

  GameMoveBlocEvent(this.row, this.column, this.value);
}
