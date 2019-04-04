import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:common/common.dart';

@Component(
  selector: 'board',
  styleUrls: [
    'board_component.css',
    'material_custom.css'
  ],
  templateUrl: 'board_component.html',
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
class BoardComponent implements OnInit, OnDestroy {
  final _chooseCell = new StreamController<CellPosition>();
  @Output() 
  get chooseCell => _chooseCell.stream;

  @Input() GameState gameState;

  BoardComponent();

  @override
  void ngOnInit() async {
  }

  @override
  void ngOnDestroy() {
  }

  void onChooseHuman(int row, int column) {
    _chooseCell.add(CellPosition(row, column));
  }
}
