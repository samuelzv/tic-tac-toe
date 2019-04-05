import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:common/common.dart';

@Component(
  selector: 'game-board',
  styleUrls: [
    'game_board_component.css',
    'material_custom.css'
  ],
  templateUrl: 'game_board_component.html',
  exports: [Player],
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
class GameBoardComponent {
  @Input() GameState gameState;
  final _chooseCell = new StreamController<CellPosition>();
  @Output() 
  get chooseCell => _chooseCell.stream;

  void onChooseHuman(int row, int column) {
    _chooseCell.add(CellPosition(row, column));
  }
}
