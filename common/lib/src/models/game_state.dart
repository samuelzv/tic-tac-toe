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
}


enum GamePhase {
  Finished,
  Pristine, 
  Started,
  Tied,
}
