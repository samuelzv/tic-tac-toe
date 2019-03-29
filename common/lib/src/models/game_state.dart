import './player.dart';
import './cell.dart';

class GameState {
  Player turn;
  List<List<Cell>> cells;

  GameState(this.turn, this.cells);
}
