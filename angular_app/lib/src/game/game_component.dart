import 'dart:async';
import 'package:angular/angular.dart';

import 'package:angular_app/src/game/components/components.dart';
import 'package:common/common.dart';

import '../services/game_bloc_service.dart';
import './components/game_score/game_score_component.dart';

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
    GameScoreComponent,
    GameStatusComponent,
    GameControlsComponent,
  ],
  pipes: []
)
class GameComponent implements OnInit {
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

  void onChooseCell(CellPosition cellPosition) {
    _gameBlocService.doGameMovement(cellPosition);
    // spawn the computer movement
    Future.delayed(Duration(seconds: 1), () => _gameBlocService.doGameMovement());
  }

  void onNewGame() {
    _gameBlocService.newGame();
  }
}
