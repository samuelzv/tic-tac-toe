import 'package:angular/angular.dart';

import 'package:common/common.dart';

@Injectable()
class GameBlocService {
  final GameBloc _gameBloc = GameBloc();

  GameBlocService();

  // methods
  void login(String username) {
    _gameBloc.dispatch(LoginBlocEvent(username));
  }

  void doGameMovement([CellPosition cellPosition]) {
    _gameBloc.dispatch(GameMovementBlocEvent(cellPosition));
  }

  void newGame() {
    _gameBloc.dispatch(NewGameBlocEvent());
  }

  Stream<DataState> get state {
    return _gameBloc.state; 
  }

  // internal
  ngOnDestroy() {
    _gameBloc.dispose();
  }

}
