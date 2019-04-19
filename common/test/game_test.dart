import 'package:test/test.dart';

// import 'package:common/src/models/game.dart';
// import 'package:common/src/models/player.dart';
// import 'package:common/src/models/cell.dart';
// import 'package:common/src/models/game_state.dart';
import 'package:common/src/models/models.dart';

void main() {
  List<List<Cell>> cells;
  Game game;
  DataState gameState;

  setUp(() {
    game = Game();
    cells = getEmptyCells();
    gameState = DataState(cells: cells);
  });

  group('Setting the turn', () {
    test('First turn is for human', () {
      Game game = Game();
      expect(game.state.turn, Player.human);
    });

    test('Doing a human movement, next turn should be for computer, next time should be for human', () {
      Game game = Game();

      game.makeMovement(CellPosition(0, 0));
      expect(game.state.turn, Player.computer);

      game.makeMovement();
      expect(game.state.turn, Player.human);
    });
  });

  group('Updating the score', () {
    test('Winning human should increment the counter score', () {
      const Player player = Player.human;
      cells[0][1].choose(player);
      cells[0][2].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(0, 0));

      expect(game.state.score.human, 1);
      expect(game.state.score.computer, 0);
      expect(game.state.score.tied, 0);
    });

    test('Winning computer should increment the counter score', () {
      const Player player = Player.computer;
      cells[0][1].choose(player);
      cells[0][2].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(0, 0));

      expect(game.state.score.computer, 1);
      expect(game.state.score.human, 0);
      expect(game.state.score.tied, 0);
    });

    test('A tied game should be incremented properly', () {
      cells[0][0].choose(Player.computer);
      cells[0][1].choose(Player.computer);
      cells[0][2].choose(Player.human);

      cells[1][0].choose(Player.human);
      cells[1][1].choose(Player.human);
      cells[1][2].choose(Player.computer);

      cells[2][0].choose(Player.computer);
      cells[2][1].choose(Player.computer);

      gameState.turn = Player.human;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 2));

      expect(game.state.score.tied, 1);
    });

  }, skip: false);

  group('Winner combinations', () {
    test('Human should win on horizontal row 0 combination', () {
      const Player player = Player.human;
      cells[0][1].choose(player);
      cells[0][2].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(0, 0));

      expect(game.state.isGameOver, true);
    });

    test('Human should win on vertical column 1 combination', () {
      const Player player = Player.human;
      cells[0][1].choose(player);
      cells[1][1].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 1));

      expect(game.state.isGameOver, true);
    });

    test('Human should win on diagonal left to right combination', () {
      const Player player = Player.human;
      cells[0][0].choose(player);
      cells[1][1].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 2));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on horizontal row 1 combination', () {
      const Player player = Player.computer;
      cells[1][1].choose(player);
      cells[1][2].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(1, 0));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on vertical column 2 combination', () {
      const Player player = Player.computer;
      cells[0][2].choose(player);
      cells[1][2].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 2));

      expect(game.state.isGameOver, true);
    });

    test('Computer should win on diagonal right to left combination', () {
      const Player player = Player.computer;
      cells[0][2].choose(player);
      cells[1][1].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 0));

      expect(game.state.isGameOver, true);
    });

   test('Winning should should not move the turn to the next', () {
      const Player player = Player.computer;
      cells[0][0].choose(player);
      cells[1][0].choose(player);

      gameState.turn = player;
      game.setState(gameState);
      game.makeMovement(CellPosition(2, 0));

      expect(game.state.isGameOver, true);
      // winning should not move the turn to the next
      expect(game.state.turn, player);
    });

  }, skip: false);
}

List<List<Cell>> getEmptyCells() {
  return [
        [Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell()],
    ];
}