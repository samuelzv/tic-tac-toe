import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/board/board_component.dart';
import 'package:common/common.dart';

import '../services/game_bloc_service.dart';

@Component(
  selector: 'game',
  styleUrls: [
    'game_component.css'
  ],
  templateUrl: 'game_component.html',
  directives: [BoardComponent],
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

    _gameBlocService.startGame();
  }

  @override
  void ngOnDestroy() {
  }

  void onChooseCell(CellPosition cellPosition) {
    if (gameState.cells[cellPosition.row][cellPosition.column].getValue() == CellValue.empty) {
      _gameBlocService.makeHumanMovement(cellPosition.row, cellPosition.column);
      Future.delayed(Duration(seconds: 2), () => _gameBlocService.makeComputerMovement());
    }
  }

}
