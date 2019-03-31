import '../bloc_event.dart';
import '../models/cell_value.dart';

class GameStartBlocEvent extends BlocEvent {
  final int boardSize = 3;

  GameStartBlocEvent();
}

class HumanMovementBlocEvent extends BlocEvent {
  final int row;
  final int column;

  HumanMovementBlocEvent(this.row, this.column);
}

class ComputerMovementBlocEvent extends BlocEvent {
  ComputerMovementBlocEvent();
}

class LoginBlocEvent extends BlocEvent {
  final String username;

  LoginBlocEvent(this.username);
}
