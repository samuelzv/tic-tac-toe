import './player.dart';
import './cell.dart';

class GameState {
  List<List<Cell>> cells;
  String username; 
  Player turn = Player.human;
  bool isGameOver = false;
  bool isGameTied = false;
  bool isPristine = true;

  GameState({this.cells});
}
