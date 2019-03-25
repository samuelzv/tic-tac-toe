import 'dart:async';

import 'package:bloc/bloc.dart';
import '../models/game.dart';

enum GameEvent { start }

class GameBloc extends Bloc<GameEvent, GameState> {
  @override
  GameState get initialState => Game().state;

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    switch(event) {
      case GameEvent.start:
        Game game = Game();
        game.start(3);

        yield game.state;
        break;

      default:
        throw Exception('unhandled event: $event');
    }
  }
}

