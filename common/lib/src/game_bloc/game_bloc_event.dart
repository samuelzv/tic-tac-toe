import '../bloc_event.dart';
import '../models/cell.dart';

class GameStartBlocEvent extends BlocEvent {
  final int boardSize = 3;

  GameStartBlocEvent();
}

class HumanMovementBlocEvent extends BlocEvent {
  final CellPosition cellPosition;

  HumanMovementBlocEvent(this.cellPosition);
}

class ComputerMovementBlocEvent extends BlocEvent {
  ComputerMovementBlocEvent();
}

class LoginBlocEvent extends BlocEvent {
  final String username;

  LoginBlocEvent(this.username);
}
