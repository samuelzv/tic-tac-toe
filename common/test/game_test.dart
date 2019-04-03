import 'package:test/test.dart';

import 'package:common/src/models/game.dart';
import 'package:common/src/models/player.dart';
import 'package:common/src/models/cell.dart';
import 'package:common/src/models/game_state.dart';

void main() {
  test('First turn is for human', () {
    Game game = Game();
    expect(game.state.turn, Player.human);
  });

  test('Doing a human movement, next turn shoul be for computer, next time should be for human', () {
    Game game = Game();
    game.start();

    game.makeMovement(Player.human, CellPosition(0, 0));
    expect(game.state.turn, Player.computer);

    game.makeMovement(Player.computer);
    expect(game.state.turn, Player.human);
  });

  group('Winner combinations', () {
    List<List<Cell>> cells;
    Game game;

    setUp(() {
      game = Game();
      cells = [
        [Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell()],
      ];
    });

    test('Human should win on horizontal row 0 combination', () {
      const Player player = Player.human;
      cells[0][1].choose(player);
      cells[0][2].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(0, 0));

      expect(game.state.isGameOver, true);
    });

    test('Human should win on vertical column 1 combination', () {
      const Player player = Player.human;
      cells[0][1].choose(player);
      cells[1][1].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(2, 1));

      expect(game.state.isGameOver, true);
    });

    test('Human should win on diagonal left to right combination', () {
      const Player player = Player.human;
      cells[0][0].choose(player);
      cells[1][1].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(2, 2));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on horizontal row 1 combination', () {
      const Player player = Player.computer;
      cells[1][1].choose(player);
      cells[1][2].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(1, 0));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on vertical column 2 combination', () {
      const Player player = Player.computer;
      cells[0][2].choose(player);
      cells[1][2].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(2, 2));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on diagonal right to left combination', () {
      const Player player = Player.computer;
      cells[0][2].choose(player);
      cells[1][1].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(2, 0));

      expect(game.state.isGameOver, true);
    });

   test('Winning should should not move the turn to the next', () {
      const Player player = Player.computer;
      cells[0][0].choose(player);
      cells[1][0].choose(player);

      GameState gameState = GameState('', player, cells, false);
      game.setState(gameState);
      game.makeMovement(player, CellPosition(2, 0));

      expect(game.state.isGameOver, true);
      // winning should not move the turn to the next
      expect(game.state.turn, player);
    });
  });
}