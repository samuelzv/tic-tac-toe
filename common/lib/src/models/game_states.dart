import './player.dart';
import './cell.dart';
import './score.dart';

class DataState {
  GameScore score = GameScore();
  List<List<Cell>> cells;
  List<CellPosition> winningCombination = [];
  String username; 
  Player turn = Player.human;
  GamePhase phase = GamePhase.Pristine;

  DataState({this.cells});

  bool get isGameOver => (phase == GamePhase.Finished || phase == GamePhase.Tied);
  bool get isGameTied => phase == GamePhase.Tied;

  DataState.fromState(DataState state) {
    score = state.score;
    cells = state.cells;
    winningCombination = state.winningCombination;
    username = state.username;
    turn = state.turn;
    phase = state.phase;
  }
}

class Welcome extends DataState{
  Welcome(DataState state): super.fromState(state);
}

class Login extends DataState{
  Login(DataState state): super.fromState(state);
}

class NewGame extends DataState{
  NewGame(DataState state): super.fromState(state);
}

class Movement extends DataState{
  Movement(DataState state): super.fromState(state);
}
class Logout extends DataState {
  Logout(DataState state): super.fromState(state);
}


enum GamePhase {
  Finished,
  Pristine, 
  Started,
  Tied,
}
