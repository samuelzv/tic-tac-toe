import '../bloc_event.dart';
import '../models/cell_value.dart';

class GameStartBlocEvent extends BlocEvent {
  final int boardSize;

  GameStartBlocEvent(this.boardSize);
}

class HumanMovementBlocEvent extends BlocEvent {
  final int row;
  final int column;

  HumanMovementBlocEvent(this.row, this.column);
}
