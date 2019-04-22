import '../bloc_event.dart';
import '../models/cell.dart';

class NewGameBlocEvent extends BlocEvent {
  NewGameBlocEvent();
}

class GameMovementBlocEvent extends BlocEvent {
  final CellPosition cellPosition;

  GameMovementBlocEvent(this.cellPosition);
}

class WelcomeBlocEvent extends BlocEvent {
}

class LoginBlocEvent extends BlocEvent {
  final String username;

  LoginBlocEvent(this.username);
}

class LogoutBlocEvent extends BlocEvent {
}
