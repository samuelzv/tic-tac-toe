import 'dart:async';

import 'package:bloc/bloc.dart';

import './../models/models.dart';
import '../bloc_event.dart';
import './game_bloc_event.dart';

class GameBloc extends Bloc<BlocEvent, GameState> {
  @override
  GameState get initialState => Game().state;

  @override
  Stream<GameState> mapEventToState(BlocEvent event) async* {
    Game game = Game();

    if (event is LoginBlocEvent) {
      game.username = event.username;

      yield game.state;
    } else if (event is GameStartBlocEvent) {
        game.setState(currentState);
        game.start(event.boardSize);

        yield game.state;
    } else if (event is HumanMovementBlocEvent) {
      game.setState(currentState);
      game.makeHumanMovement(event.row, event.column);

      yield game.state;
    } else if (event is ComputerMovementBlocEvent) {
      game.setState(currentState);
      game.makeComputerMovement();

      yield game.state;
    } else {
      yield currentState;
    }
  }
}

