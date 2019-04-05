import 'dart:async';
import 'package:angular/angular.dart';

import 'package:angular_app/src/game/components/components.dart';
import 'package:common/common.dart';

import '../services/game_bloc_service.dart';

@Component(
  selector: 'game',
  styleUrls: [
    'game_component.css'
  ],
  templateUrl: 'game_component.html',
  exports: [
    Player
  ],
  directives: [
    NgIf,
    GameBoardComponent,
    GameStatusComponent,
    GameControlsComponent,
  ],
  pipes: []
)
class GameComponent implements OnInit, OnDestroy {
  final GameBlocService _gameBlocService;
  GameState gameState;

  GameComponent(this._gameBlocService);

  @override
  void ngOnInit() async {
    _gameBlocService.state
      .listen((GameState state) { 
        gameState = state;
      });

    _gameBlocService.newGame();
  }

  @override
  void ngOnDestroy() {
    print('On Destroy');
  }

  void onChooseCell(CellPosition cellPosition) {
    if (gameState.cells[cellPosition.row][cellPosition.column].value == null) {
      _gameBlocService.makeHumanMovement(cellPosition);
      Future.delayed(Duration(seconds: 1), () => _gameBlocService.makeComputerMovement());
    }
  }

  void onNewGame() {
    _gameBlocService.newGame();
  }
}
