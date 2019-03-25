import 'board.dart';
import 'cell.dart';

class GameState {
  final board;

  GameState({this.board});
}

class Game {
  Board _board;

  Game();

  factory Game.fromState(GameState gameState) {
    Game game = Game();
    game._board =  gameState.board;

    return game;
  }

  start(int boardSize) {
    _board = Board(boardSize);
  }
  
  List<List<Cell>> getBoard() => _board.getBoard();

  GameState get state {
    return GameState(board: _board);
  }

}