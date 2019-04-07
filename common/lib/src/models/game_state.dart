import './player.dart';
import './cell.dart';
import './score.dart';

class GameState {
  GameScore score = GameScore();
  List<List<Cell>> cells;
  List<CellPosition> winningCombination = [];
  String username; 
  Player turn = Player.human;
  GamePhase phase = GamePhase.Pristine;

  GameState({this.cells});

  bool get isGameOver => (phase == GamePhase.Finished || phase == GamePhase.Tied);
}

enum GamePhase {
  Finished,
  Pristine, 
  Started,
  Tied,
}
