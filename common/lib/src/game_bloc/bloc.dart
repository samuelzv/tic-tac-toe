import 'dart:async';

import 'package:bloc/bloc.dart';

import './../models/models.dart';
import '../bloc_event.dart';
import './game_bloc_event.dart';

class GameBloc extends Bloc<BlocEvent, DataState> {
  @override
  DataState get initialState => Game().state;

  @override
  Stream<DataState> mapEventToState(BlocEvent event) async* {
    Game game = Game();

    if (event is LoginBlocEvent) {
      game.username = event.username;

      yield Login(game.state);
    } else if (event is NewGameBlocEvent) {
        // keep score
        game
          ..username = currentState.username
          ..score = currentState.score;

        yield NewGame(game.state);
    } else if (event is GameMovementBlocEvent) {
      game.setState(currentState);
      game.makeMovement(event.cellPosition);

      yield Movement(game.state);
    } else {
      yield Initial(currentState);
    }
  }
}

