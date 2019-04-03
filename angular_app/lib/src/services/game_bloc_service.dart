import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';

import 'package:common/common.dart';

@Injectable()
class GameBlocService {
  final GameBloc _gameBloc = GameBloc();

  GameBlocService();

  // methods
  void login(String username) {
    _gameBloc.dispatch(LoginBlocEvent(username));
  }

  void makeHumanMovement(CellPosition cellPosition) {
    _gameBloc.dispatch(HumanMovementBlocEvent(cellPosition));
  }

  void makeComputerMovement() {
    _gameBloc.dispatch(ComputerMovementBlocEvent());
  }

  void startGame() {
    _gameBloc.dispatch(GameStartBlocEvent());
  }

  Stream<GameState> get state {
    return _gameBloc.state; 
  }


  // internal
  ngOnDestroy() {
    _gameBloc.dispose();
  }

}
