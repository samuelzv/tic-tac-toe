import 'dart:async';

import 'package:bloc/bloc.dart';
import '../models/game.dart';

import '../bloc_event.dart';
import './game_bloc_event.dart';

class GameBloc extends Bloc<BlocEvent, GameState> {
  @override
  GameState get initialState => Game().state;

  @override
  Stream<GameState> mapEventToState(BlocEvent event) async* {
    if (event is GameStartBlocEvent) {
        Game game = Game();
        game.start(event.boardSize);

        yield game.state;
    }

    if (event is GameMoveBlocEvent) {
      Game game = Game.fromState(currentState);
      game.setCellValue(event.row, event.column, event.value);

      yield game.state;
    }
  }
}

