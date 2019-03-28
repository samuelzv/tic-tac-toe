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
  exports: [CellValue],
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
  ],
  pipes: [BlocPipe]
)
class BoardComponent implements OnInit, OnDestroy {
  GameBloc gameBloc;
  GameState gameState;
  BoardComponent();

  @override
  void ngOnInit() async {
    gameBloc = GameBloc();

    gameBloc.state
      .listen((GameState state) => gameState = state);

    gameBloc.dispatch(GameStartBlocEvent(3));
  }

  @override
  void ngOnDestroy() {
    gameBloc.dispose();
  }

  void onChoose(int row, int column) {
    gameBloc.dispatch(GameMoveBlocEvent(row, column, CellValue.cross));
  }
}
