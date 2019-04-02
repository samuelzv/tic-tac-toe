import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:common/common.dart';

import '../services/game_bloc_service.dart';

@Component(
  selector: 'board',
  styleUrls: [
    'board_component.css',
    'material_custom.css'
  ],
  templateUrl: 'board_component.html',
  exports: [CellValue, Player],
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    NgClass,
  ],
  pipes: [BlocPipe]
)
class BoardComponent implements OnInit, OnDestroy {
  final _chooseCell = new StreamController<CellPosition>();
  @Output() 
  get chooseCell => _chooseCell.stream;

  final GameBlocService _gameBlocService;
  GameState gameState;

  BoardComponent(this._gameBlocService);

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

  void onChooseHuman(int row, int column) {
    _chooseCell.add(CellPosition(row, column));
  }

  String getIcon(int row, int column) {
    CellValue cellValue = gameState.cells[row][column].getValue(); 
    if (cellValue == CellValue.empty) {
      return '';
    } else {
      return cellValue == CellValue.cross ? 'pets' : 'android';
    }
  }
}
