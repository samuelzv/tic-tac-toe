import './player.dart';
import './cell.dart';

class GameState {
  List<List<Cell>> cells;
  List<CellPosition> winningCombination = [];
  String username; 
  Player turn = Player.human;
  // bool isGameOver = false;
  // bool isGameTied = false;
  // bool isPristine = true;
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
